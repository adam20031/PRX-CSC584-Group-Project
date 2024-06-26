/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package book;
import java.io.Serializable;

/**
 *
 * @author Nasrien
 */
public class Book implements Serializable
{
    String book_id;
    String book_name;
    String book_seriesNo;
    String book_genre;
    String book_author;
    String book_availability;
    
    public Book ()
    {   
        book_id = null;
        book_name = null;
        book_seriesNo = null;
        book_genre = null;
        book_author = null;
        book_availability = null;
    }
    
    public Book (String book_id, String book_name, String book_seriesNo, String book_genre, String book_author, String book_availability)
    {   
        this.book_id =  book_id;
        this.book_name =  book_name;
        this.book_seriesNo = book_seriesNo;
        this.book_genre = book_genre;
        this.book_author = book_author;
        this.book_availability = book_availability; 
    }
    
    public String getBookID ()
    {
        return book_id;
    }
    public String getBookName ()
    {
        return book_name;
    }
    public String getSeriesNo ()
    {
        return book_seriesNo;
    }
    public String getGenre ()
    {
       return book_genre;
    }
    public String getAuthor ()
    {
        return book_author;
    }
    public String getAvailability ()
    {
        return book_availability;
    }
    public void setBookID (String book_id)
    {
        this.book_id = book_id;
    }
    public void setBookName (String book_name)
    {
        this.book_name = book_name;
    }
    public void setSeriesNo(String book_seriesNo)
    {
        this.book_seriesNo = book_seriesNo;
    }
    public void setAuthor (String book_author)
    {
        this.book_author = book_author;
    }
    public void setAvailability (String book_availability)
    {
        this.book_availability = book_availability;
    }
}
