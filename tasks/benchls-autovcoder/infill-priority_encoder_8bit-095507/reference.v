module autovcoder_095507 (
    data,
    enable,
    eq
)  /* synthesis synthesis_clearbox=1 */;
  input [2:0] data;
  input enable;
  output [7:0] eq;
`ifndef ALTERA_RESERVED_QIS
  // synopsys translate_off
`endif
  tri0 [2:0] data;
  tri1 enable;
`ifndef ALTERA_RESERVED_QIS
  // synopsys translate_on
`endif

  wire [2:0] data_wire;
  wire enable_wire;
  wire [7:0] eq_node;
  wire [7:0] eq_wire;
  wire [3:0] w_anode1613w;
  wire [3:0] w_anode1630w;
  wire [3:0] w_anode1640w;
  wire [3:0] w_anode1650w;
  wire [3:0] w_anode1660w;
  wire [3:0] w_anode1670w;
  wire [3:0] w_anode1680w;
  wire [3:0] w_anode1690w;

  assign data_wire = data,
      enable_wire = enable,
      eq = eq_node,
      eq_node = eq_wire[7:0],
      eq_wire = {
        w_anode1690w[3],
        w_anode1680w[3],
        w_anode1670w[3],
        w_anode1660w[3],
        w_anode1650w[3],
        w_anode1640w[3],
        w_anode1630w[3],
        w_anode1613w[3]
      },
      w_anode1613w = {
        (w_anode1613w[2] & (~data_wire[2])),
        (w_anode1613w[1] & (~data_wire[1])),
        (w_anode1613w[0] & (~data_wire[0])),
        enable_wire
      },
      w_anode1630w = {
        (w_anode1630w[2] & (~data_wire[2])),
        (w_anode1630w[1] & (~data_wire[1])),
        (w_anode1630w[0] & data_wire[0]),
        enable_wire
      },
      w_anode1640w = {
        (w_anode1640w[2] & (~data_wire[2])),
        (w_anode1640w[1] & data_wire[1]),
        (w_anode1640w[0] & (~data_wire[0])),
        enable_wire
      },
      w_anode1650w = {
        (w_anode1650w[2] & (~data_wire[2])),
        (w_anode1650w[1] & data_wire[1]),
        (w_anode1650w[0] & data_wire[0]),
        enable_wire
      },
      w_anode1660w = {
        (w_anode1660w[2] & data_wire[2]),
        (w_anode1660w[1] & (~data_wire[1])),
        (w_anode1660w[0] & (~data_wire[0])),
        enable_wire
      },
      w_anode1670w = {
        (w_anode1670w[2] & data_wire[2]),
        (w_anode1670w[1] & (~data_wire[1])),
        (w_anode1670w[0] & data_wire[0]),
        enable_wire
      },
      w_anode1680w = {
        (w_anode1680w[2] & data_wire[2]),
        (w_anode1680w[1] & data_wire[1]),
        (w_anode1680w[0] & (~data_wire[0])),
        enable_wire
      },
      w_anode1690w = {
        (w_anode1690w[2] & data_wire[2]),
        (w_anode1690w[1] & data_wire[1]),
        (w_anode1690w[0] & data_wire[0]),
        enable_wire
      };
endmodule

