package com.kyk.web.service;

import com.kyk.web.model.User;

import java.util.List;

/**
 * Created by kyk on 2016/7/15.
 */
public interface UserService {

    List<User> getAllUser();

    User getUserByPhoneOrEmail(String emailOrPhone, Short state);

    User getUserById(Long userId);

    int add(User theUser);

    int update(User theUser);
}
