## The contents of this file are subject to the Common Public Attribution
## License Version 1.0. (the "License"); you may not use this file except in
## compliance with the License. You may obtain a copy of the License at
## http://code.reddit.com/LICENSE. The License is based on the Mozilla Public
## License Version 1.1, but Sections 14 and 15 have been added to cover use of
## software over a computer network and provide for limited attribution for the
## Original Developer. In addition, Exhibit A has been modified to be
## consistent with Exhibit B.
##
## Software distributed under the License is distributed on an "AS IS" basis,
## WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
## the specific language governing rights and limitations under the License.
##
## The Original Code is reddit.
##
## The Original Developer is the Initial Developer.  The Initial Developer of
## the Original Code is reddit Inc.
##
## All portions of the code written by reddit are Copyright (c) 2006-2015
## reddit Inc. All Rights Reserved.
###############################################################################

<%namespace file="utils.m" import="error_field"/>

<%def name="form_content()">
  %if not thing.embedded:
    <input type="hidden" name="name"
      value="${thing.user.name if thing.user else ''}" />
  %endif
  <input type="hidden" name="type" value="${thing.permissions_type}">
  <input type="hidden" name="permissions"
    value="${thing.permissions.dumps() if thing.permissions else '+all'}">
  %if not thing.embedded:
    ${error_field("USER_DOESNT_EXIST", "name")}
    ${error_field("NO_USER", "name")}
  %endif
  ${error_field("INVALID_PERMISSION_TYPE", "type")}
  ${error_field("INVALID_PERMISSIONS", "permissions")}
  %if not thing.embedded:
    <span class="status"></span>
  %endif
</%def>

<div class="permissions">
  %if thing.embedded:
    ${form_content()}
  %else:
    <form action="/post/setpermissions" method="post"
          class="setpermissions pretty-form medium-text"
          onsubmit="return post_form(this, 'setpermissions')">
      ${form_content()}
      <button type="submit">${_('save')}</button>
    </form>
  %endif
  <div class="permission-summary">
  </div>
</div>
