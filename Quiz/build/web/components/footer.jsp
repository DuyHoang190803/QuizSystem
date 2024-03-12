<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    .footer {
        font-family: Arial, sans-serif;
        margin: 0 auto;

    }

    footer {
        background-color: #1D2332;
        padding: 20px 0;
    }

    .footer-title{
        color: #ffffff;
        font-weight: 600;
        font-size: 18px;
        margin-bottom: 20px;
    }

    .footer-content{
        display: flex;
        flex-direction: column;
        max-width: 70%;
    }



    .feedback-form{
        border-radius: 7px;
        font-size: 15px;
    }

</style>

<!-- Your content goes here -->

<!-- Footer -->
<div class="footer">
    <footer>
        <div style="max-width: 85%; display: flex;  align-content: center; margin: auto; padding: 10px;">
            <div style="width: 40%;">
                <div class="footer-title">
                    FEEDBACK
                </div>
                <div>
                    <form class="footer-content" action="feedback">
                        <c:set value="${sessionScope.account }" var="i"/>
                        <input type="hidden" value="${i.userName}" name="name">
                        <textarea class="feedback-form" name="feedback" rows="6" cols="10" placeholder="FeedBack Here..."></textarea>
                        <input style="margin-top: 5px; border-radius: 5px; height: 35px; background-color:#5B7DFF; color: #ffffff; " type="submit" value="Send">
                    </form>
                </div>               
            </div>
            <div style="width: 30%;">
                <div class="footer-title">
                    USEFUL LINKS
                </div>
                <div class="footer-content">

                </div> 
            </div>
            <div style="width: 30%;">
                <div class="footer-title">
                    CONTACT
                </div>
                <div class="footer-content" style="color: #ffffff;">
                    <p>FPT University</p>
                    <p>BDHoang03@gmail.com</p>
                    <p>+84 763310655</p>
                </div> 
            </div>
        </div>
    </footer>
</div>