/* global jsyaml */

// Jquery form convert to JSON
(function ($) {
  $.fn.serializeFormJSON = function () {

    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
      if (o[this.name]) {
        if (!o[this.name].push) {
          o[this.name] = [o[this.name]];
        }
        o[this.name].push(this.value || '');
      } else {
        o[this.name] = this.value || '';
      }
    });
    return o;
  };
})(jQuery);




app = {
  config: {
    apiUrl: window.location.protocol + "//" + window.location.host + "/"
  },
  init: function (cb) {
    app.api.init(function (ok, resp) {
      if (ok) {
        var footer = "&copy; " + app.api.info.service.name + " API v" + app.api.info.service.version + " <span style='color:grey'>on host  " + app.api.info.server.hostname + "</span>";
        $("#appFooter").html(footer);
        app.api.getFree("config/session.json", null, function (ok, response) {
          if (ok) {
            app.api.session = response;
            $("#courseID").text(app.api.session.course);
            console.log(app.api.session);
            app.api.getFree("course-data/manifest.yml", null, function (ok, response) {
              if (ok) {
                app.api.course = jsyaml.load(response);
                console.log(app.api.course);
                if (typeof cb === "function")
                  cb();
              }
              else {
                var resp1 = (response.message || response.statusText || response);
                var message = "Could not find training course detail because " + resp1;
                $(app.tools.alertBox("danger", message)).prependTo("div#mainContainer");
                console.error(resp1);
              }
            });
          }
          else {
            var resp1 = (response.message || response.statusText || response);
            var message = "Could not find training session detail because " + resp1;
            $(app.tools.alertBox("danger", message)).prependTo("div#mainContainer");
            console.error(resp1);
          }
        });
      }
      else {
        var message = "Could not connect to LIBRE API because " + resp;
        $(app.tools.alertBox("danger", message)).prependTo("div#mainContainer");
        console.error(resp);
      }
    });
  },
  initInfo: function () {
    app.init(function () {
      app.infoPage.init();
    });
  },
  initSurvey: function () {
    app.init(function () {
      app.survey.init();
      console.log("done");
    });
  },
  api: {
    info: null,
    init: function (callback) {
      this.get("info", null, function (error, response) {
        if (error) {
          app.api.info = response;
          if (typeof callback === "function")
            callback(true, response);
          else
            console.log(response);
        }
        else {
          var message = (error.message || error.statusText || error);
          if (typeof callback === "function")
            callback(false, message);
          else
            console.error(message);
        }
      });
    },
    get: function (path, query, callback) {
      return this.call("GET", path, query, callback);
    },
    getFree: function (path, query, callback) {
      var config = {
        method: "GET",
        url: app.config.apiUrl + path
      };
      if (query && query !== null && query !== false) {
        config.data = query;
      }
      $.ajax(config)
      .always(function (response, status) {
        if (status === "success") {
          callback(true, response);
        }
        else {
          callback(false, response);
        }
      });
    },
    post: function (path, query, callback) {
      return this.call("POST", path, query, callback);
    },
    put: function (path, query, callback) {
      return this.call("PUT", path, query, callback);
    },
    delete: function (path, query, callback) {
      return this.call("DELETE", path, query, callback);
    },
    call: function (method, path, query, callback) {
      var config = {
        method: method,
        url: app.config.apiUrl + path
      };
      if (query && query !== null && query !== false) {
        config.data = query;
      }
      $.ajax(config)
      .always(function (response, status) {
        if (status === "success") {
          console.log(response);
          if (response.code === "ok") {
            callback(true, response.data);
          }
          else {
            callback(false, response);
          }
        }
        else {
          callback(false, response);
        }
      });
    }
  },
  survey: {
    init: function () {
      if (app.api.course !== undefined) {
        $(".courseInfoID .form-control-static").text(app.api.course.id + " v" + app.api.course.version);
        $(".courseInfoName .form-control-static").text(app.api.course.name);
        $(".courseInfoFormat .form-control-static").text(app.api.course.time.days + "days (" + app.api.course.time.hours + " hours)");
      }
      if (app.api.session !== undefined) {
        $(".sessionInfoInstructor .form-control-static").text(app.api.session.instructor);
        $(".sessionInfoState .form-control-static").text(app.api.session.state);
        $(".sessionInfoType .form-control-static").text(app.api.session.type);
        $(".sessionInfoStart .form-control-static").text(app.api.session.start);
        var table = $("#surveyList .table");
        $(app.api.session.students).each(function (index, item) {
          var row = "<tr><td>" + item.workstation + "</td>";
          row += "<td>" + item.name + "</td>";
          row += "<td><a class=\"btn btn-primary btn-sm\" href=\"#\" onclick=\"app.survey.onClickEvaluate('" + item.id + "')\" target=\"blank\" role=\"button\"><span class=\"glyphicon glyphicon-thumbs-up\" aria-hidden=\"true\"></span> Evaluate</a></td>";
          row += "</tr>";
          table.append(row);
        });
        $("#surveyContainer button.btn-default").click(function () {
          $("#mainContainer").show();
          $("#surveyContainer").hide();
        });
        $("#surveyContainer button.btn-primary").click(function () {
          var jd = $("#surveyContainer form").serializeFormJSON();
          console.log(jd);
          var errMsg = "You must give";
          if (!jd.id || jd.id === "") {
            errMsg = "Your student ID is not defined, please <b>report to your instructor</b>, " + errMsg;
          }
          if (!jd.company || jd.company === "") {
            errMsg += " your <b>company name</b>, ";
          }
          if (!jd.responsability || jd.responsability === "") {
            errMsg += " your <b>responsability</b>,";
          }
          if (!jd.name || jd.name === "") {
            errMsg += " your <b>first and last name</b>,";
          }
          if (!jd.email || jd.email === "") {
            errMsg += " your professional <b>e-mail</b>,";
          }
          if (!jd.phone || jd.phone === "") {
            errMsg += " your company <b>phone number</b>,";
          }
          if (errMsg === "You must give") {
            app.api.post("collect/survey-" + jd.id + ".json", JSON.stringify(jd), function (ok, response) {
              if (ok) {
                $(app.tools.infoBox("Thank you for submitting this survey")).prependTo("#mainContainer");
                $("#mainContainer").show();
                $("#surveyContainer").hide();
              }
              else {
                var resp1 = (response.message || response.statusText || response);
                var message = "Could not record your survey because " + resp1;
                $(app.tools.alertBox("danger", message)).prependTo("div#surveyContainer form");
                console.error(resp1);
              }
            });
          }
          else {
            $(app.tools.alertBox("danger", errMsg.substring(0, errMsg.length - 1) + ".")).prependTo("#surveyContainer form");
          }



        });
      }
    },
    onClickEvaluate: function (i) {
      $(app.api.session.students).each(function (index, item) {
        if (item.id === i) {
          $("#mainContainer").hide();
          $("#surveyContainer #inputID").val(item.id);
          $("#surveyContainer #inputName").val(item.name);
          $("#surveyContainer").show();
        }
      });
    }
  },
  infoPage: {
    init: function () {
      if (app.api.course !== undefined) {
        $("#courseInfoID .form-control-static").text(app.api.course.id + " v" + app.api.course.version);
        $("#courseInfoName .form-control-static").text(app.api.course.name);
        $("#courseInfoDesc .form-control-static").text(app.api.course.desc);
        $("#courseInfoFormat .form-control-static").text(app.api.course.time.days + "days (" + app.api.course.time.hours + " hours)");
        $("#courseInfoUrlPub .form-control-static").html("<a class=\"btn btn-primary btn-sm\" href=\"" + app.api.course.url.public + "\" target=\"blank\" role=\"button\"><span class=\"glyphicon glyphicon-info-sign\" aria-hidden=\"true\"></span> Learn more on this course</a>");
        $("#courseInfoUrlManual .form-control-static").html("<a class=\"btn btn-primary btn-sm\" href=\"" + app.api.course.url.course + "\" target=\"blank\" role=\"button\"><span class=\"glyphicon glyphicon-bookmark\" aria-hidden=\"true\"></span> Learn more on this course</a>");
        var table = $("#courseInfo .table");
        $(app.api.course.content).each(function (index, item) {
          var row = "<tr><td>" + item.id + "</td>";
          row += "<td>" + item.name + "</td><td>" + item.time + "min</td></tr>";
          table.append(row);
        });
      }
      if (app.api.session !== undefined) {
        $("#sessionInfoID .form-control-static").text(app.api.session.id);
        $("#sessionInfoName .form-control-static").text(app.api.session.course);
        $("#sessionInfoInstructor .form-control-static").text(app.api.session.instructor);
        $("#sessionInfoState .form-control-static").text(app.api.session.state);
        $("#sessionInfoType .form-control-static").text(app.api.session.type);
        $("#sessionInfoStart .form-control-static").text(app.api.session.start);
        var table = $("#sessionInfo .table");
        $(app.api.session.students).each(function (index, item) {
          var row = "<tr><td>" + item.workstation + "</td>";
          row += "<td>" + item.name + "</td>";
          row += "</tr>";
          table.append(row);
        });
      }
    }
  },
  tools: {
    alertBox: function (type, message) {
      return '<div class="alert alert-' + type + ' alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + message + "</div>";
    },
    infoBox: function (message) {
      return '<div class="alert alert-info alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + message + "</div>";
    }
  }
};
