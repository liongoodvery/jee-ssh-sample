package org.lion.action;

import com.opensymphony.xwork2.ModelDriven;
import net.lingala.zip4j.core.ZipFile;
import org.apache.struts2.ServletActionContext;
import org.lion.domain.Book;
import org.lion.service.BookService;
import org.lion.utils.JsonUtil;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by lion on 3/13/17.
 */
public class BookAction extends BaseAction implements ModelDriven<Book> {
    private BookService bookService;
    private Book model = new Book();
    private File upload;
    private String uploadFileName;
    private String uploadContentType;

    private String uploadDir;

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    public String add() throws Exception {
        return "addBook";
    }


    public String put() throws Exception {
        model.setFileName(uploadFileName);
        model.setMIME(uploadContentType);
        model.setFileLength(upload.length());
        try {
            String uuid = java.util.UUID.randomUUID().toString();
            model.setFilePath(uuid);
            Files.copy(Paths.get(upload.getAbsolutePath()), Paths.get(uploadDir, uuid));
            bookService.saveOrUpdate(model);
            JsonUtil.ajaxResult(ServletActionContext.getResponse(), 0, "");
        } catch (Exception e) {
            JsonUtil.ajaxResult(ServletActionContext.getResponse(), 1, e.getMessage());
            e.printStackTrace();
        }
        return NONE;
    }

    public String list() throws Exception {
        List<Book> books = bookService.findAll();
        super.put("books", books);
        return "list";
    }


    public String read() throws Exception {
        model = bookService.findById(model.getId());
        String real = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("books");
        Path desc = Paths.get(real, model.getFilePath());
        if (!Files.exists(desc)) {
            ZipFile zipFile = new ZipFile(Paths.get(uploadDir, model.getFilePath()).toString());
            zipFile.extractAll(desc.toString());
        }
        return "read";
    }

    @Override
    public Book getModel() {
        return model;
    }
}
