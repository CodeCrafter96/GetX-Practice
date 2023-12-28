import 'package:flutter/material.dart';
import 'package:getx_practice/drop_down/expanded_list_animation_widget.dart';
import 'package:getx_practice/drop_down/scrollable.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

List<String> _list = ['Dog', "Cat", "Mouse", 'Lion'];

class _DropDownState extends State<DropDown> {
  bool isStrechedDropDown = false;
  int? groupValue;
  String title = 'Select Animals';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Custom Drop Down ",
          style: TextStyle(color: Color.fromARGB(255, 251, 251, 251)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff10131B),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffbbbbbb),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        children: [
                          Container(
                            // height: 45,
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            // decoration: BoxDecoration(
                            //     color: Colors.amberAccent,
                            //     border: Border.all(),
                            //     borderRadius: const BorderRadius.all(
                            //         Radius.circular(12))),
                            constraints: const BoxConstraints(
                              minHeight: 45,
                              minWidth: double.infinity,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      title,
                                      style:
                                          TextStyle(color: Color(0xffF9F7FF)),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isStrechedDropDown = !isStrechedDropDown;
                                    });
                                  },
                                  child: Icon(
                                    isStrechedDropDown
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ExpandedSection(
                            expand: isStrechedDropDown,
                            height: 100,
                            child: MyScrollbar(
                              builder: (context, scrollController2) =>
                                  ListView.builder(
                                padding: EdgeInsets.all(0),
                                controller: scrollController2,
                                shrinkWrap: true,
                                itemCount: _list.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          _list.elementAt(index),
                                          style: TextStyle(
                                              color: Color(0xffF9F7FF)),
                                        ),
                                        onTap: () {
                                          setState(
                                            () {
                                              title = _list.elementAt(index);
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
