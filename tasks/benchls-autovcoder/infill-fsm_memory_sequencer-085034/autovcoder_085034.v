module autovcoder_085034 #(
    parameter N = 2,
    parameter STATES = 3,
    localparam LOAD = 2'b00,
    localparam PROC = 2'b01,
    localparam OUT = 2'b10,
    localparam SUB = N / 2 + 1  //para N par, numero de estados de direccionamiento de memoria
) (
    input i_sop,
    i_eop,
    clk,
    rst,
    i_chblk,

    output reg [              N+1:0] o_we,
    output     [clog2(STATES-1)-1:0] o_state,
    output     [ clog2(SUB-1) - 1:0] o_substate,
    output reg [   clog2(N+1) - 1:0] o_memSelect
);


  reg [N+1:0] we_rw_status;
  reg [N+1:0] we_proc_status;
  reg [clog2(N+1) - 1:0] memSelect_load, memSelect_out;
  reg [ clog2(SUB-1) - 1:0] substate;
  reg [clog2(STATES-1)-1:0] state;
  reg [clog2(STATES-1)-1:0] next_state;
  reg                       chblk;

  assign o_state = state;
  assign o_substate = substate;

  [MASKED]

  always @(*) state = {i_eop, i_sop};

  always @(*) begin
    case (state)

      LOAD: begin
        o_memSelect = memSelect_load;
        o_we = we_rw_status;
      end

      PROC: begin
        o_we = we_proc_status;
        o_memSelect = {(clog2(N + 1) - 1) {1'b0}};
      end

      OUT: begin
        o_we = {(N + 2) {1'b0}};
        o_memSelect = memSelect_out;
      end

      default: begin
        o_we = {(N + 2) {1'b0}};
        o_memSelect = {(clog2(N + 1) - 1) {1'b0}};
      end
    endcase
  end

  function integer clog2;
    input integer depth;
    for (clog2 = 0; depth > 0; clog2 = clog2 + 1) depth = depth >> 1;
  endfunction

endmodule

