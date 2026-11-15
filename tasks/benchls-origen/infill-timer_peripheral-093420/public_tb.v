// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093420 dut (
    .CLK(clk),
    .WE(in_vec[64:64]),
    .ABUS(in_vec[63:32]),
    .DBUSI(in_vec[31:0]),
    .DBUSO(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h036732a1f6363fefe;
    stim[1] = 65'h0a9562e0c27741501;
    stim[2] = 65'h0fdd289e0c70d21c6;
    stim[3] = 65'h1e909dc7adb99e396;
    stim[4] = 65'h08cfb21a5835d7413;
    stim[5] = 65'h0645047d3e17fb89c;
    stim[6] = 65'h0b3bd9c5da540acd3;
    stim[7] = 65'h09dc3fa6171edf3df;
    stim[8] = 65'h0c2c6bd406d57e5ba;
    stim[9] = 65'h08effc541d99cf25d;
    stim[10] = 65'h1cde60a38b470d428;
    stim[11] = 65'h139cbe8efa04b61e3;
    stim[12] = 65'h12743d70ec888101c;
    stim[13] = 65'h15204bc325422a590;
    stim[14] = 65'h07442652e0d8844ea;
    stim[15] = 65'h099f81d62ed95b25d;
    stim[16] = 65'h16ff21a018e0b48b3;
    stim[17] = 65'h13888ac7437a26b76;
    stim[18] = 65'h1c9b43696d89d3e31;
    stim[19] = 65'h0b99fbd67e8bc4789;
    stim[20] = 65'h126555cacad024011;
    stim[21] = 65'h1f8f35ffbb7101192;
    stim[22] = 65'h1b284bbfa3b6ec82d;
    stim[23] = 65'h13974425d0227fecb;
    stim[24] = 65'h0616c417f97adb7fb;
    stim[25] = 65'h180016aa2944a245d;
    stim[26] = 65'h12a654b18650685c1;
    stim[27] = 65'h0cfaf491fee28f8ea;
    stim[28] = 65'h18d57ca3cef0d3466;
    stim[29] = 65'h0650ce8640339ad40;
    stim[30] = 65'h0983b8089f682d5f4;
    stim[31] = 65'h0017678401dacfe3f;
    stim[32] = 65'h03800cde3f28a43b5;
    stim[33] = 65'h16a1eecee781ec8a5;
    stim[34] = 65'h0c556e857c0b852e6;
    stim[35] = 65'h12f178f04de86b176;
    stim[36] = 65'h0c6f87b3fd90aa0e4;
    stim[37] = 65'h03ff77a6a7d0d40bb;
    stim[38] = 65'h00fca6dbd6a45ae3c;
    stim[39] = 65'h0d0d8f6b0a4df72a7;
    stim[40] = 65'h18eabed386004471a;
    stim[41] = 65'h15310ee53cb33ccb9;
    stim[42] = 65'h154d7ca588c517064;
    stim[43] = 65'h1079a69574911ec20;
    stim[44] = 65'h1c3631afbec9f654f;
    stim[45] = 65'h19915108c9e521f27;
    stim[46] = 65'h1f04a8e432411d2fd;
    stim[47] = 65'h17b9acb4e1725b403;
    stim[48] = 65'h0ee9e7c06f5b7ac7f;
    stim[49] = 65'h006ef56a015b34759;
    stim[50] = 65'h03c6826172005c042;
    stim[51] = 65'h05bc76037e37cd39a;
    stim[52] = 65'h162a0f560734240e0;
    stim[53] = 65'h0e2adb67e975f89e7;
    stim[54] = 65'h14f04690289627c9e;
    stim[55] = 65'h0fe0bfba4528080c1;
    stim[56] = 65'h03fccd00154033d27;
    stim[57] = 65'h1aaeca5246073d01c;
    stim[58] = 65'h1c32195af59625151;
    stim[59] = 65'h089f31c5bee01be5d;
    stim[60] = 65'h152627defb0dca57e;
    stim[61] = 65'h186bcbe748cce8876;
    stim[62] = 65'h12f6a28277ef694d2;
    stim[63] = 65'h1fcf64cd1c404f689;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
