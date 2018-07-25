package com.pos.orm;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FtpCtrl {
	private static Logger logger = LoggerFactory.getLogger(FtpCtrl.class);

	public int upload(String localFilePath, String remoteFilePath, String fileName, HttpServletRequest request) throws Exception{
		
		FTPClient ftp = null;
		FileInputStream fis = null;
		File uploadFile = new File(localFilePath);
		
		String url = "midas2y2.dothome.co.kr";
		String id = "midas2y2";
		String pwd = "jspmvc2mysql";
		String port = "21";
		
		int result = -1;
		
		try {
			ftp = new FTPClient();
			ftp.setControlEncoding("UTF-8");
			ftp.connect(url,Integer.parseInt(port));
			ftp.login(id,pwd);
			ftp.enterLocalPassiveMode();
			ftp.changeWorkingDirectory(remoteFilePath);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			try
			{
				fis= new FileInputStream(uploadFile);
				boolean isSuccess = ftp.storeFile(fileName, fis);
				
				if(isSuccess)
				{
					logger.info("업로드 성공");
					result = 1;
				}
				else
				{
					logger.info("파일 업로드 실패");
				}
			}
			catch(Exception e)
			{
				logger.info("FTP Upload Failed");
				e.printStackTrace();
			}
			finally
			{
				if(fis != null)
				{
					fis.close();
					return result;
				}
			}
			ftp.logout();
		}
		catch (Exception e)
		{
			logger.info("FTP setting Failed");
			e.printStackTrace();
		}
		finally
		{
			if(ftp!=null&&ftp.isConnected())
			{
				ftp.disconnect();
				return result;
			}
		}
		return result;
	}

	public int delete(String remoteFilePath, String fileName, HttpServletRequest request) throws Exception{
		
		FTPClient ftp = null;
		String url = "midas2y2.dothome.co.kr";
		String id = "midas2y2";
		String pwd = "jspmvc2mysql";
		String port = "21";
		int result = -1;
		
		try
		{
			ftp = new FTPClient();
			ftp.setControlEncoding("UTF-8");
			ftp.connect(url,Integer.parseInt(port));
			ftp.login(id,pwd);
			ftp.enterLocalPassiveMode();
			ftp.changeWorkingDirectory(remoteFilePath);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			
			boolean isSucess = ftp.deleteFile(fileName);
			
			if(isSucess)
			{
				logger.info("파일 삭제 성공");
				result = 1;
			}
			else
			{
				logger.info("파일 삭제 실패");
			}
		}
		catch(Exception e)
		{
			e.getStackTrace();
		}
		try
		{
			ftp.logout();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		finally {
			if(ftp!= null && ftp.isConnected())
			{
				try
				{
					ftp.disconnect();
				}
				catch(IOException e)
				{
					e.printStackTrace();
				}
				return result;
			}
		}
		return result;
	}

}
