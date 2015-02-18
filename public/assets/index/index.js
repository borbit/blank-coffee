(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
/** @jsx React.DOM */;
var ListItem, React;

React = require('react');

ListItem = require('./list__item');

module.exports = React.createClass({
  render: function() {
    var items;
    items = this.props.items.map(function(item) {
      return React.createElement(ListItem, {
        "title": item.title
      });
    });
    return React.createElement("ul", {
      "className": "list"
    }, items);
  }
});



},{"./list__item":2}],2:[function(require,module,exports){
/** @jsx React.DOM */;
var React;

React = require('react');

module.exports = React.createClass({
  render: function() {
    return React.createElement("li", {
      "className": "list__item"
    }, this.props.title);
  }
});



},{}],3:[function(require,module,exports){
var List, React, items;

React = require('react');

List = require('../../blocks/list/list');

items = [
  {
    title: 'List item 1'
  }, {
    title: 'List item 2'
  }, {
    title: 'List item 3'
  }, {
    title: 'List item 4'
  }
];

React.renderComponent(List({
  items: items
}), document.getElementById('list'));



},{"../../blocks/list/list":1}]},{},[3])