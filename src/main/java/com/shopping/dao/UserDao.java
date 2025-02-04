package com.shopping.dao;

import com.shopping.entity.User;

import java.util.List;

public interface UserDao {

    public User getUser(int id);

    public User getUser(String nameOrEmail);

    public void addUser(User user);

    public boolean deleteUser(int id);

    public boolean updateUser(User user);

    public List<User> getAllUser();

    public User getUserByUserId(String user_id);
}
