(function (global, undefined) {
    var demo = {};

    function setupImageMapAreas() {
        var map = getImageMap(demo.imageMapID);
        $telerik.$(map).find("area").each(function (i) {
            this.setAttribute("id", "area" + i);
            $telerik.addHandler(this, "click", $telerik.cancelRawEvent);
        });
    }

    function getImageMap(id) {
        return $get("ImageMap" + id);
    }

    function serverID(name, id) {
        demo[name] = id;
    }

    Sys.Application.add_init(setupImageMapAreas);
    global.serverID = serverID;
})(window);