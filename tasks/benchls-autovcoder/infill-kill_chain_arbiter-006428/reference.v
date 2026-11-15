module autovcoder_006428 #(
    parameter p_num_reqs = 2
) (
    input  logic                  kin,        // kill in
    input  logic [p_num_reqs-1:0] priority_,  // (one-hot) 1 is req w/ highest pri
    input  logic [p_num_reqs-1:0] reqs,       // 1 = making a req, 0 = no req
    output logic [p_num_reqs-1:0] grants,     // (one-hot) 1 is req won grant
    output logic                  kout        // kill out
);

  // The internal kills signals essentially form a kill chain from the
  // highest priority to the lowest priority requester. Unliked the fixed
  // arb, the priority input is used to determine which request has the
  // highest priority. We could use a circular kill chain, but static
  // timing analyzers would probably consider it a combinational loop
  // (which it is) and choke. Instead we replicate the kill chain. See
  // Principles and Practices of Interconnection Networks, Dally +
  // Towles, p354 for more info.

  logic [2*p_num_reqs:0] kills;
  assign kills[0] = 1'b1;

  logic [2*p_num_reqs-1:0] priority_int;
  assign priority_int = {{p_num_reqs{1'b0}}, priority_};

  logic [2*p_num_reqs-1:0] reqs_int;
  assign reqs_int = {reqs, reqs};

  logic [2*p_num_reqs-1:0] grants_int;

  // The per requester logic first computes the grant signal and then
  // computes the kill signal for the next requester.

  localparam p_num_reqs_x2 = (p_num_reqs << 1);
  genvar i;
  generate
    for (i = 0; i < 2 * p_num_reqs; i = i + 1) begin : per_req_logic

      // If this is the highest priority requester, then we ignore the
      // input kill signal, otherwise grant is true if this requester is
      // not killed and it is actually making a req.

      assign grants_int[i] = priority_int[i] ? reqs_int[i] : (!kills[i] && reqs_int[i]);

      // If this is the highest priority requester, then we ignore the
      // input kill signal, otherwise kill is true if this requester was
      // either killed or it received the grant.

      assign kills[i+1] = priority_int[i] ? grants_int[i] : (kills[i] || grants_int[i]);

    end
  endgenerate

  // To calculate final grants we OR the two grants from the replicated
  // kill chain. We also AND in the global kin signal.

  assign grants
    = (grants_int[p_num_reqs-1:0] | grants_int[2*p_num_reqs-1:p_num_reqs])
    & {p_num_reqs{~kin}};

  assign kout = kills[2*p_num_reqs] || kin;

endmodule

