package org.lion.service;

import org.lion.dao.BookDao;
import org.lion.domain.Book;
import org.lion.utils.CommonUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lion on 3/13/17.
 */
@Transactional
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }


    @Override
    public void saveOrUpdate(Book book) {
        if (CommonUtils.isEmpty(book.getId())) {
            bookDao.save(book);
        } else {
            bookDao.update(book);
        }
    }

    @Override
    public List<Book> findAll() {
        return bookDao.findAll();
    }

    @Override
    public Book findById(String id) {
        return bookDao.findById(id);
    }
}
