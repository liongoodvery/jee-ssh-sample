package org.lion.service;

import org.lion.domain.Book;

import java.util.List;

/**
 * Created by lion on 3/13/17.
 */
public interface BookService {
    void saveOrUpdate(Book book);

    List<Book> findAll();

    Book findById(String id);
}
