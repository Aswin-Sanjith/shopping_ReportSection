
<div class="bg-modal" id="myForm">
    <div class="modal-content">
        <button class="close" onclick="closeForm()">+</button>
        <div class="boxCreate">
            <div class="formRight">
                <div class="formHeader">
                    <h3 id="CreateEditHead" >CREATE CONTACT</h3>
                </div>
                <form id="myform" action="action/createAction.cfm" enctype='multipart/form-data' method="post" onsubmit="return create_validate();" >
                <input type="hidden" id="Addressid" name="addressid">
                    <div class="formBody1">
                        <h4>Personal Contact</h4>
                        <div class="flex personalContact">
                            <div>
                            <cfoutput><input type="hidden" value="#session.sessionId#" name="userId"></cfoutput>
                            <h5>Title *</h5>
                            <select name="title" id="title"  onclick="title_val()">
                                <option ></option>
                                <option value="Miss">Miss</option>
                                <option value="Mr">Mr</option>
                                <option value="Mr">Mrs</option>
                            </select>
                            <p id="title_error" class="errorMessage"></p>
                            </div>
                            <div>
                                <h5>First Name *</h5>
                                <input type="text" placeholder="First Name" id="firstName" name="firstName" onchange="fname_val()">
                                <p id="nb1" class="errorMessage"></p>
                            </div>
                            <div>
                                <h5>Last Name *</h5>
                                <input type="text" placeholder="Last Name" id="lastName" name="lastName" onchange="lname_val()">
                                <p id="nb3" class="errorMessage"></p>
                            </div>
                        </div>
                        <div class="flex personalContact">
                            <div>
                                <h5>Gender *</h5>
                                <select name="Gender" id="gender" name="gender" onchange="gender_val()">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Others">Others</option>
                                </select>
                            </div>
                            <div>
                                <h5>Date Of Birth *</h5>
                                <input type="Date" placeholder="DOB" class="address" id="dob" name="dob" onchange=" dob_val()">
                                <p id="doberror" class="errorMessage"></p>
                            </div>
                        </div>
                        <div class="flex personalContact">
                            <div>
                                <h5>Upload Photo</h5>
                                <input type="file" accept="image/png, image/gif, image/jpeg"  id="photo" name="photo" onchange="image_val()">
                                <p id="imageser" class="errorMessage"></p>
                            </div>
                        </div>
                    </div>
                    <div class="formBody1">
                        <h4>Contact Details</h4>
                        <div class="flex personalContact">
                            <div>
                                <h5>Address *</h5>
                                <input type="text" placeholder="Your Address" class="address" id="address" name="address" onchange="address_val()">
                                <p id="address_error" class="errorMessage"></p>
                            </div>
                            <div>
                                <h5>Street *</h5>
                                <input type="text" placeholder="Your Street Name" class="address" id="street" name="street" onchange="street_val()">
                                <p id="street_error" class="errorMessage"></p>
                            </div>
                        </div>
                        <div class="flex personalContact">
                            <div>
                                <h5>Pin Code *</h5>
                                <input type="number" placeholder="Your Pin Code" class="address" id="pincode" name="pincode" onchange="pin_val()">
                                <p id="pin_error" class="errorMessage"></p>
                            </div>
                            <div>
                                <h5>Email *</h5>
                                <input type="email" placeholder="Your Email" class="address" id="email" name="email" onchange="mail_val()">
                                <p id="email_error" class="errorMessage"></p>
                            </div>
                        </div>
                        <div class="flex personalContact">
                            <div>
                                <h5>Phone Number *</h5>
                                <input type="text" placeholder="Your Phone Number" class="address" id="phoneNumber" name="phoneNumber" onchange="phone_val()">
                                <p id="error" class="errorMessage"></p>
                            </div>
                        </div>
                    </div>
                    <input type="submit"  id="createButton" value="CREATE" class="createButton" onsubmit="return checkemail();" >
                </form>
            </div>
            <img id="contact_img" src="images/person.png">    
        </div>
    </div>
</div>