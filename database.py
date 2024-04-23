import flet as ft
from flet import (
    Column,
    Container,
    ElevatedButton,
    Page,
    Row,
    Text,
    UserControl,
    border_radius,
    colors,
    MainAxisAlignment,
    TextField,
    DataTable,
    DataColumn,
    DataRow
)


def main(page: ft.Page):
  page.title = "Crime Management"
  page.horizontal_alignment = MainAxisAlignment.CENTER

  search_bar = TextField(hint_text="Search Employee")
  page.add(
      Container(
          content=Column(
              controls=[
                  Row(controls=[search_bar, ElevatedButton("Search")]),
                  ElevatedButton("Add Employee"),
                  DataTable(
                      columns=[
                          DataColumn(label=Text("ID")),
                          DataColumn(label=Text("Name")),
                          DataColumn(label=Text("Code")),
                      ]
                  ),
              ]
          )
      )
  )



ft.app(target=main)