 
void main() {
 Book book1 = Book("sarmad farid", true, "2323432432", '2034'); 
 Book book2 = Book("hamza farid", true, "2323432432", '1933' ); 
 Member member = Member("1", "Sarmad Farid") ; 

  Library library = Library(); 
  library.addBook(book1); 
  library.addBook(book2); 
  library.listBook(); 
  
   library.loansBooks(book1, member); 
   
     library.listBook();
     library.listLoanBooks(); 

}

class Book {
  String title ;
  String author; 
  String isbn; 
  bool isAvailable ;

  Book(this.author, this.isAvailable, this.isbn, this.title); 
} 

class Library {
  List <Book> books = []; 
  List <Loan> loans = []; 
 
  void loansBooks(Book book, Member member){
   if(book.isAvailable){
    book.isAvailable = false ;
    loans.add(Loan(book, DateTime.now(), member, DateTime.now() )); 
   } 
   else{
     print("book ${book.title} is not avaiable ");
   }
  }

  void addBook(Book book){
    books.add(book);  
    print("books added sucessfully"); 
  }

  void removeBook(Book book) {
  books.remove(book);  
  print("book ${book.title} remove sucessfully"); 
  }

  void listBook(){
    print("List of all books in library:"); 
    for ( var book in books){
      print("titile: ${book.title}, author ${book.author}, isbn: ${book.isbn}, isAvailable: ${book.isAvailable}"); 
    } 

  }
  
  void listLoanBooks(){
      print("List of loan books in library:"); 
     for ( var loan in loans){   
        print("titile: ${loan.book.title} these books are in loan");
      } 
  }

}

class Member {
  String memberid; 
  String name; 
  Member(this.memberid, this.name); 
} 

class Loan {
  Book book; 
  Member member; 
  DateTime loanDate; 
  DateTime? returnDate; 

  Loan(this.book, this.loanDate, this.member, this.returnDate); 

  void returnBook(){
    returnDate = DateTime.now(); 
    book.isAvailable = true ; 
  }

}



 
 




 