import ballerina/http;
import ballerina/io;

configurable int port = ?;

// readonly => immutable
// record   => named fields (field can be accessed with object.field_name)
type Book readonly & record {|
    string isbn;
    string title;
    string[] authors;
|};

// data
final readonly & table<Book> key(isbn) books = table [
        {
            isbn: "9781800200630",
            title: "Cloud Native Application with Ballerina",
            authors: ["Dhanishka Madushan"]
        },
        {
            isbn: "9781484251386",
            title: "Cloud Native Application with Ballerina",
            authors: ["Anjana Fernando", "Lakmal Warusawithana"]
        },
        {
            isbn: "9780072122794",
            title: "Rebol: The Official Guide",
            authors: []
        }
    ];

# Service
service / on new http:Listener(port) {

    # Get a book
    # + isbn - Book ISBN (International Standard Book Number)
    # + return - Book details or error
    resource function get book/[string isbn]() returns Book|http:NotFound {
        Book? book = books[isbn]; // Book? same as union type Book|()
        if book is () {
            return <http:NotFound>{body: {"error": string `Book with ISBN ${isbn} Not Found`}};
        } else {
            return book;
        }
    }

    # Get a list of authors
    # + isbn - Book ISBN (International Standard Book Number)
    # + return - Array of authors or error
    resource function get book/[string isbn]/authors() returns json|http:NotFound {
        Book? book = books[isbn];
        if book is () {
            return <http:NotFound>{body: {"error": string `Book with ISBN ${isbn} Not Found`}};
        }
        if book.authors.length() > 0 {
            return {"authors": book.authors};
        } else {
            return <http:NotFound>{body: {"error": string `No authors found for book with ISBN ${isbn}`}};
        }
    }

    # Find books from a given author
    # + author - Book author
    # + return - Array of books
    # + return - array with all books or error
    resource function get books/[string author]() returns Book[]|http:NotFound {
        Book[] response = from Book b in books
            where (b.authors.indexOf(author) != ())
            select b;
        if response.length() == 0 {
            return <http:NotFound>{body: {"error": string `No book found for author ${author}`}};
        } else {
            return response;
        }
    }

    # Get all books
    # + return - array with all books or error
    resource function get books() returns Book[]|http:NotFound {
        if books.length() == 0 {
            return <http:NotFound>{body: {"error": "No book found"}};
        } else {
            return books.toArray();
        }
    }
}

# Application entrypoint. Optional for a service. Provided to demonstrate
# that a main can also be used in conjuntion with a service
public function main() {
    io:println(`Starting HTTP server on port ${port}...`);
}
