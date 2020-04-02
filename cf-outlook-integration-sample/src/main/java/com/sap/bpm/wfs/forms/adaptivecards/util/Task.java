package com.sap.bpm.wfs.forms.adaptivecards.util;

import com.fasterxml.jackson.databind.node.ObjectNode;

public class Task {

    private ObjectNode info;
    private ObjectNode context;
    private ObjectNode form;

    public Task(ObjectNode info, ObjectNode context, ObjectNode form) {
        this.info = info;
        this.context = context;
        this.form = form;
    }

    public ObjectNode getInfo() {
        return info;
    }

    public ObjectNode getForm() {
        return form;
    }

    public void setForm(ObjectNode form) {
        this.form = form;
    }

    public ObjectNode getContext() {
        return context;
    }

    public void setContext(ObjectNode context) {
        this.context = context;
    }

    public void setInfo(ObjectNode info) {
        this.info = info;
    }

}