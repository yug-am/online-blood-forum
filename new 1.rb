<% if @is_admin %>
<h1><%= @request.requestID %></h1>

<p><%= @request.bloodType %></p>
<%if not @donors %>
<h1>Empty</h1>
  <%else%>
<table class="table table-striped table-bordered table-hover">
    <thead class="thead-dark">
      <tr>
        <th>donorID</th>
        <th>Blood Group</th>
        <th>Location</th>
        <!remove this>
        <th> Is Used</th>
        <th>action</th>
        
      </tr>
    </thead>

    <tbody>
      <% @donors.each do |donor| %>
           <% if donor.isUsed==false%>
             <tr>

          <td> <%= donor.donorID %></td>
          <td> <%= donor.bloodGroup %></td>
          <td><%= donor.location %></td>       
             <!remove this>
        
          <td><%= donor.isUsed %></td> 

          <td>   <%= link_to "Allocate",  admin_dashboard_path(:did=> donor.donorID,:rid=>@request.requestID ), class: "btn btn-secondary" %>
          </td>       
        </tr>
    <%end%>
      <% end %>
  
    </tbody>
  </table>

  <%end%>
  <%else%>
  
   <h1 style="color:  darkorchid; text-align: center;">Not Found</h1>
 <h5 style="color:  darkorchid ; text-align: center;">Looks like you are lost, Aren't we all?</h5>

 </br>
 <center>
   <img src="img_404.png" class="center" width="400"   height="500" />
  </center>
<%end%>