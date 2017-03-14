package org.lion;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.lion.domain.Book;
import org.lion.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lion on 3/13/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-test.xml"})
@Transactional
@Rollback
public class BookTest {
    @Autowired
    BookService bookService;

    @Test
    public void test22() throws Exception {
        Book book = new Book();
        book.setBookName("aaa");
        book.setFileLength(10000L);
        book.setMIME("text/html");
        book.setFileName("abcdeftg");
        bookService.saveOrUpdate(book);

        List<Book> all = bookService.findAll();
        Assert.assertEquals(1, all.size());
        for (Book book1 : all) {
            System.out.println(book1);
        }
    }
}
