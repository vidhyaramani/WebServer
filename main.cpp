#include <QGuiApplication>
#include <QQuickView>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QUrl>
#include <QTimer>
#include <QFile>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;   //As mentioned QuickView is used
    QNetworkAccessManager manager;

    // Connect with server
    QUrl serverUrl("http://localhost:18730/api/v1/getQML");
    QNetworkRequest request(serverUrl);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    //Connect with Web.qml
    QByteArray postData = "{\"filename\": \"/home/vidhya/ServerProject/WebServerqt/Web.qml\"}"; //ensure the path

    QNetworkReply *reply = manager.post(request, postData);
    QObject::connect(reply, &QNetworkReply::finished, [&]() {
        if (reply->error() == QNetworkReply::NoError) {
            QByteArray response = reply->readAll();
            QJsonDocument jsonDoc = QJsonDocument::fromJson(response);
            QString qmlContent = jsonDoc.object().value("content").toString();

            // Save the QML content to temp file
            QFile tempFile("temp.qml");
            if (tempFile.open(QIODevice::WriteOnly)) {
                tempFile.write(qmlContent.toUtf8());
                tempFile.close();
            }

            // Fetch the QML
            view.setSource(QUrl::fromLocalFile(tempFile.fileName()));
            view.show();
        } else {
            qDebug() << "Load the fetching QML:" << reply->errorString();
        }
        reply->deleteLater();
    });

    return app.exec();
}
