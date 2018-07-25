<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="modal fade" id="Reg-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 align="" class="modal-title" id="Login">Register Member</h4>
                    </div>
                    <div class="modal-body">
                        <form action="./mCtrl" method="post">
                        <input type="hidden" name="flag" value="1">
                            <div class="form-group">
                                <input type="text" class="form-control" id="email" placeholder="email" name="email" required>
                            	<br>
                            	<span id="checkid"></span>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="email-modal" placeholder="nickname" name="nickname" required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password-modal" placeholder="password" name="pwd" required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password-modal" placeholder="repeat password" name="rpwd" required>
                            </div>
                            <p class="text-center">
                                <button  type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Register</button>
                                <button class="btn btn-warning"><i class="fa fa-sign-in"></i> Reset</button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
