/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.licenceInfo.service;

import com.model.licenceInfo.dao.LicenceInfoDao;
import com.model.licenceInfo.dto.Licenceinfo;
import com.util.DataUtil;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class LicenceInfoService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    private String filePath;

    public LicenceInfoService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addLicence() throws FileUploadException, Exception
    {
        Licenceinfo licenceinfo=new Licenceinfo();
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        for (FileItem item : items)
        {
            if (item.isFormField())
            {
                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                //   System.out.println("fieldName:" + fieldName);
                if (fieldName.equalsIgnoreCase("hospitalname"))
                {
                    licenceinfo.setClientname(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdname"))
                {
                    licenceinfo.setChiefmdname(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdconctno"))
                {
                    licenceinfo.setCmdcontno(DataUtil.parseLong(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("cmdemailid"))
                {
                    licenceinfo.setCmdemailid(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdmobno"))
                {
                    licenceinfo.setCmdmobno(DataUtil.parseLong(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdemailid1"))
                {
                    licenceinfo.setEmailid(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("website"))
                {
                    licenceinfo.setWebaddress(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("addressline1"))
                {
                    licenceinfo.setAddressline1(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("addressline2"))
                {
                    licenceinfo.setAddressline2(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("addressline3"))
                {
                    licenceinfo.setAddressline3(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("addressline4"))
                {
                    licenceinfo.setAddressline4(DataUtil.emptyString(item.getString()));
                    
                }
                
            }

            else
            {
                String fieldName = item.getFieldName();
                 if (fieldName.equalsIgnoreCase("uploadcopmanyPhoto")) {
                  

                    String fileName = (DataUtil.emptyString(item.getName()));
                   
                    if (!fileName.equalsIgnoreCase("")) {

                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain="licencephoto";
                        String completepath=ipath+remain;
                        
                        File path=new File(completepath);

                    
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }


                        File uploadedFile = new File(path + "/" + fileName);
                       // System.out.println(uploadedFile.getAbsolutePath());
                        licenceinfo.setLogo1("licencephoto/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        licenceinfo.setLogo1(fileName);
                    }
                }

                if (fieldName.equalsIgnoreCase("companylogofile")) {
                
                    String fileName = (DataUtil.emptyString(item.getName()));
                   
                    if (!fileName.equalsIgnoreCase("")) {

                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain="licencephoto";
                        String completepath=ipath+remain;
                        
                        File path=new File(completepath);

                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }


                        File uploadedFile = new File(path + "/" + fileName);
                       // System.out.println(uploadedFile.getAbsolutePath());
                        licenceinfo.setLogo2("licencephoto/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        licenceinfo.setLogo2(fileName);
                    }
                }
            }

        }

        licenceinfo=new LicenceInfoDao().addLicence(licenceinfo);
       
        if (licenceinfo.getLicenceid() == 00) {
            return true;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return false;
        }



    }

    public boolean viewLicence()
    {

       
        boolean result = false;
        try {
            List<Licenceinfo> list = new LicenceInfoDao().viewLicence();
            httpSession.setAttribute("LicenceList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean viewLicenceDetails() {
        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
           
            Licenceinfo licenceDetails = new LicenceInfoDao().viewLicenceDetails(id);

            if (licenceDetails == null) {
                result = false;
            } else {
                httpSession.setAttribute("licenceInfoDetails", licenceDetails);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void deleteLicence() {

       
        String id=request.getParameter("id");
       
        new LicenceInfoDao().deleteLicence(id);

    }

    public long updateLicence() throws FileUploadException, Exception
    {
        Licenceinfo licenceinfo=new Licenceinfo();
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        String ipathl1="";
        String ipathl2="";
        for (FileItem item : items)
        {
            if (item.isFormField())
            {
                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                //   System.out.println("fieldName:" + fieldName);



                if (fieldName.equalsIgnoreCase("licenceid")) {

                    
                    licenceinfo.setLicenceid(DataUtil.parseLong(item.getString()));
                }

                if (fieldName.equalsIgnoreCase("hospitalname"))
                {
                    licenceinfo.setClientname(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdname"))
                {
                    licenceinfo.setChiefmdname(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("cmdconctno"))
                {
                    licenceinfo.setCmdcontno(DataUtil.parseLong(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdemailid"))
                {
                    licenceinfo.setCmdemailid(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("cmdmobno"))
                {
                    licenceinfo.setCmdmobno(DataUtil.parseLong(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("cmdemailid1"))
                {
                    licenceinfo.setEmailid(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("website"))
                {
                    licenceinfo.setWebaddress(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("addressline1"))
                {
                    licenceinfo.setAddressline1(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("addressline2"))
                {
                    licenceinfo.setAddressline2(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("addressline3"))
                {
                    licenceinfo.setAddressline3(DataUtil.emptyString(item.getString()));
                  
                }
                if (fieldName.equalsIgnoreCase("addressline4"))
                {
                    licenceinfo.setAddressline4(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("companyphoto"))
                {
                    ipathl1=item.getString();

                }
                if (fieldName.equalsIgnoreCase("companylogo"))
                {
                    ipathl2=item.getString();

                }


            }

            else
            {
                String fieldName = item.getFieldName();
                 if (fieldName.equalsIgnoreCase("uploadcopmanyPhoto")) {
                   
                    String fileName = (DataUtil.emptyString(item.getName()));
                    
                    if (!fileName.equalsIgnoreCase("")) {
                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain="licencephoto";
                        String completepath=ipath+remain;
                       
                        File path=new File(completepath);

                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }


                        File uploadedFile = new File(path + "/" + fileName);
                       // System.out.println(uploadedFile.getAbsolutePath());
                        licenceinfo.setLogo1("licencephoto/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        
                       
                       licenceinfo.setLogo1(ipathl1);


                    }
                }

                if (fieldName.equalsIgnoreCase("companylogofile")) {
                   
                    String fileName = (DataUtil.emptyString(item.getName()));
                  
                    if (!fileName.equalsIgnoreCase("")) {

                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain="licencephoto";
                        String completepath=ipath+remain;
                       
                        File path=new File(completepath);

                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }


                        File uploadedFile = new File(path + "/" + fileName);
                       
                        licenceinfo.setLogo2("licencephoto/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {

                            licenceinfo.setLogo2(ipathl2);

                    }
                }
            }
        }


        licenceinfo=new LicenceInfoDao().updateLicence(licenceinfo);

        return licenceinfo.getLicenceid();

    }

    public int viewLicenceInt()
    {

       
        int licensize=0;
        try {
            List<Licenceinfo> list = new LicenceInfoDao().viewLicence();
           licensize=list.size();
        } catch (Exception e) {
            e.printStackTrace();
            licensize=0;
        }
        return licensize;

    }

    



}
