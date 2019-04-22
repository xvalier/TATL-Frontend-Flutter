# TATL-Frontend-Flutter
Flutter (Dart) Build of TATL Frontend. Cross-platform for Android and iOS

This repository contains source code to build .apk and .ios frontend applications. The source code contains UI layout and logic only, all significant processing will be performed in the backend application. TATL-Frontend-Flutter will communicate to the backend application via the gRPC protocol.

The application contains 4 pages to help an inexperianced user resolve issues they are facing:
1) Initial Page -- User can enter a question/issue in free-text here. Their free-text description will be sent to a backend application.
2) Symptoms Page -- The backend application will return a list of 'symptoms' that are closest to the description of the problem. The user can check off the symptoms which are true. The 'activated' symptoms will be sent back to the backend application
3) Next Page -- After getting activated symptoms, the backend will keep asking yes/no questions to the user. These questions will include additional symptoms (to narrow down the list of resolutions), as well as resolutions to try out. The user will response to each question with just a yes/no response.
4) Close Page -- Once a resolution is found, this page will show up to close the session. If the issue was found to have no resolutions, this page will tell the use to contact an expert on the matter.

