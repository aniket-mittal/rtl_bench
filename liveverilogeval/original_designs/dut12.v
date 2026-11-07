

module dut
(
  in,
  ctrl,
  out
);

  input [7:0] in;
  input [2:0] ctrl;
  output [7:0] out;
  wire [7:0] x;
  wire [7:0] y;

  dut_dependency_2
  ins_17
  (
    .in0(in[7]),
    .in1(1'b0),
    .sel(ctrl[2]),
    .out(x[7])
  );


  dut_dependency_2
  ins_16
  (
    .in0(in[6]),
    .in1(1'b0),
    .sel(ctrl[2]),
    .out(x[6])
  );


  dut_dependency_2
  ins_15
  (
    .in0(in[5]),
    .in1(1'b0),
    .sel(ctrl[2]),
    .out(x[5])
  );


  dut_dependency_2
  ins_14
  (
    .in0(in[4]),
    .in1(1'b0),
    .sel(ctrl[2]),
    .out(x[4])
  );


  dut_dependency_2
  ins_13
  (
    .in0(in[3]),
    .in1(in[7]),
    .sel(ctrl[2]),
    .out(x[3])
  );


  dut_dependency_2
  ins_12
  (
    .in0(in[2]),
    .in1(in[6]),
    .sel(ctrl[2]),
    .out(x[2])
  );


  dut_dependency_2
  ins_11
  (
    .in0(in[1]),
    .in1(in[5]),
    .sel(ctrl[2]),
    .out(x[1])
  );


  dut_dependency_2
  ins_10
  (
    .in0(in[0]),
    .in1(in[4]),
    .sel(ctrl[2]),
    .out(x[0])
  );


  dut_dependency_2
  ins_27
  (
    .in0(x[7]),
    .in1(1'b0),
    .sel(ctrl[1]),
    .out(y[7])
  );


  dut_dependency_2
  ins_26
  (
    .in0(x[6]),
    .in1(1'b0),
    .sel(ctrl[1]),
    .out(y[6])
  );


  dut_dependency_2
  ins_25
  (
    .in0(x[5]),
    .in1(x[7]),
    .sel(ctrl[1]),
    .out(y[5])
  );


  dut_dependency_2
  ins_24
  (
    .in0(x[4]),
    .in1(x[6]),
    .sel(ctrl[1]),
    .out(y[4])
  );


  dut_dependency_2
  ins_23
  (
    .in0(x[3]),
    .in1(x[5]),
    .sel(ctrl[1]),
    .out(y[3])
  );


  dut_dependency_2
  ins_22
  (
    .in0(x[2]),
    .in1(x[4]),
    .sel(ctrl[1]),
    .out(y[2])
  );


  dut_dependency_2
  ins_21
  (
    .in0(x[1]),
    .in1(x[3]),
    .sel(ctrl[1]),
    .out(y[1])
  );


  dut_dependency_2
  ins_20
  (
    .in0(x[0]),
    .in1(x[2]),
    .sel(ctrl[1]),
    .out(y[0])
  );


  dut_dependency_2
  ins_07
  (
    .in0(y[7]),
    .in1(1'b0),
    .sel(ctrl[0]),
    .out(out[7])
  );


  dut_dependency_2
  ins_06
  (
    .in0(y[6]),
    .in1(y[7]),
    .sel(ctrl[0]),
    .out(out[6])
  );


  dut_dependency_2
  ins_05
  (
    .in0(y[5]),
    .in1(y[6]),
    .sel(ctrl[0]),
    .out(out[5])
  );


  dut_dependency_2
  ins_04
  (
    .in0(y[4]),
    .in1(y[5]),
    .sel(ctrl[0]),
    .out(out[4])
  );


  dut_dependency_2
  ins_03
  (
    .in0(y[3]),
    .in1(y[4]),
    .sel(ctrl[0]),
    .out(out[3])
  );


  dut_dependency_2
  ins_02
  (
    .in0(y[2]),
    .in1(y[3]),
    .sel(ctrl[0]),
    .out(out[2])
  );


  dut_dependency_2
  ins_01
  (
    .in0(y[1]),
    .in1(y[2]),
    .sel(ctrl[0]),
    .out(out[1])
  );


  dut_dependency_2
  ins_00
  (
    .in0(y[0]),
    .in1(y[1]),
    .sel(ctrl[0]),
    .out(out[0])
  );


endmodule



module dut_dependency_2
(
  in0,
  in1,
  sel,
  out
);

  input in0;
  input in1;
  input sel;
  output out;
  assign out = (sel)? in1 : in0;

endmodule

