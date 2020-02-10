using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USFarmExchange {
  public class ResourceLink {
    private static ResourceLink _instance;
    public int Id;
    public string Title;
    public string Description;
    public string URL;
    public string ThumbNail;
    public int Count;
    public DateTime LastClicked;
    public bool Active;
    public static ResourceLink StaticInstance => _instance.IsNullOrEmpty() ? _instance = new ResourceLink() : _instance;

    public ResourceLink() { }
    public ResourceLink(int id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_RESOURCE_LINK_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString().GetInt32();
      Title = dataRow["Title"].ToString();
      Description = dataRow["Description"].ToString();
      URL = dataRow["URL"].ToString();
      ThumbNail = dataRow["ThumbNail"].ToString();
      Count = dataRow["Count"].ToString().GetInt32();
      LastClicked = dataRow["LastClicked"].ToString().GetAsDate();
      Active = dataRow["Active"].ToString().GetAsBool();
    }

    public void SaveResourceLink() {
      if(Id == 0) {
        SqlHelpers.Insert(SqlStatements.SQL_CREATE_RESOURCE_LINK.FormatWith(
          Title.FixSqlString(), URL.FixSqlString(), (Active) ? "1" : "0", ThumbNail.FixSqlNull(), Description.FixSqlString()));
      } else {
        SqlHelpers.Update(SqlStatements.SQL_UPDATE_RESOURCE_LINK_BY_ID.FormatWith(
          Title.FixSqlString(), URL.FixSqlString(), (Active) ? "1" : "0", ThumbNail.FixSqlNull(), Description.FixSqlString(), Id));
      }
    }
  }
}