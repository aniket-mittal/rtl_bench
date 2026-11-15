// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08831 dut (
    .ACLK(clk),
    .ARESETN(in_vec[35:35]),
    .S_AXIS_TDATA(in_vec[34:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .S_AXIS_TVALID(in_vec[1:1]),
    .M_AXIS_TREADY(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[38:38]),
    .M_AXIS_TVALID(out_vec[37:37]),
    .M_AXIS_TDATA(out_vec[36:5]),
    .M_AXIS_TLAST(out_vec[4:4]),
    .M_AXIS_TKEEP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h14ae683af;
    stim[1] = 36'h3be7474cb;
    stim[2] = 36'h8a6d0b79e;
    stim[3] = 36'h9c6db893b;
    stim[4] = 36'hded4a64a2;
    stim[5] = 36'hab9a18830;
    stim[6] = 36'he1464d078;
    stim[7] = 36'hd26b5be19;
    stim[8] = 36'hd0cce1017;
    stim[9] = 36'he73e4d1e6;
    stim[10] = 36'hb2e8cbbcd;
    stim[11] = 36'hdbfa74677;
    stim[12] = 36'hae6ffdb16;
    stim[13] = 36'h8d4bd7b01;
    stim[14] = 36'hcbe4aba1e;
    stim[15] = 36'hf6f483f24;
    stim[16] = 36'hec0f383d2;
    stim[17] = 36'h1f464156a;
    stim[18] = 36'h83cfee63c;
    stim[19] = 36'ha0fb80240;
    stim[20] = 36'hdcde6e749;
    stim[21] = 36'hf22e7ac16;
    stim[22] = 36'h9360c7a4a;
    stim[23] = 36'hfa04a7fa4;
    stim[24] = 36'hdf0e93b44;
    stim[25] = 36'ha3e02b14c;
    stim[26] = 36'hd66b418a9;
    stim[27] = 36'hf897e051d;
    stim[28] = 36'hd1ee5c021;
    stim[29] = 36'hf7bc5ac97;
    stim[30] = 36'h8b7266074;
    stim[31] = 36'h8cf7411a7;
    stim[32] = 36'h8db8b724b;
    stim[33] = 36'hdbacc22e0;
    stim[34] = 36'hd8cd49adb;
    stim[35] = 36'h97fb2edc2;
    stim[36] = 36'hac31a2d57;
    stim[37] = 36'hc17a66a4f;
    stim[38] = 36'hc12253d7c;
    stim[39] = 36'haccd3c742;
    stim[40] = 36'hf55b8d9ae;
    stim[41] = 36'hbc856b0a2;
    stim[42] = 36'hb5c340fb6;
    stim[43] = 36'hd83ac1ea2;
    stim[44] = 36'hb965bc8c6;
    stim[45] = 36'h9b6d6ccb9;
    stim[46] = 36'hf173db776;
    stim[47] = 36'hd98764219;
    stim[48] = 36'h822515315;
    stim[49] = 36'hae2544c93;
    stim[50] = 36'hd09537558;
    stim[51] = 36'he0b9d6df6;
    stim[52] = 36'ha3c6c2815;
    stim[53] = 36'h9f88fce0d;
    stim[54] = 36'h84781696b;
    stim[55] = 36'h8e3bced23;
    stim[56] = 36'ha241afbb1;
    stim[57] = 36'hf10cc6e70;
    stim[58] = 36'ha9297c05e;
    stim[59] = 36'hc2c06cb97;
    stim[60] = 36'h958bfd1b7;
    stim[61] = 36'hf414f4fa4;
    stim[62] = 36'hb5db18cc1;
    stim[63] = 36'hefe9f5281;
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
      expv[0] = 39'hxxxxxxxxxf;
      expv[1] = 39'h000000000f;
      expv[2] = 39'h000000000f;
      expv[3] = 39'h400000000f;
      expv[4] = 39'h471b6e24ef;
      expv[5] = 39'h5ed097b76f;
      expv[6] = 39'h5ed097b76f;
      expv[7] = 39'h5ed097b76f;
      expv[8] = 39'h5ed097b76f;
      expv[9] = 39'h5303cff7af;
      expv[10] = 39'h4cd3633f2f;
      expv[11] = 39'h4cd3633f2f;
      expv[12] = 39'h43d20058ef;
      expv[13] = 39'h4f6dffc52f;
      expv[14] = 39'h4f6dffc52f;
      expv[15] = 39'h42672aad8f;
      expv[16] = 39'h42672aad8f;
      expv[17] = 39'h3d6af8bccf;
      expv[18] = 39'h000000000f;
      expv[19] = 39'h000000000f;
      expv[20] = 39'h000000000f;
      expv[21] = 39'h000000000f;
      expv[22] = 39'h400000000f;
      expv[23] = 39'h44d831e92f;
      expv[24] = 39'h44d831e92f;
      expv[25] = 39'h44d831e92f;
      expv[26] = 39'h44d831e92f;
      expv[27] = 39'h44d831e92f;
      expv[28] = 39'h44d831e92f;
      expv[29] = 39'h44d831e92f;
      expv[30] = 39'h42c7489b6f;
      expv[31] = 39'h42c7489b6f;
      expv[32] = 39'h460518e1ef;
      expv[33] = 39'h497346ab0f;
      expv[34] = 39'h497346ab0f;
      expv[35] = 39'h5fa699166f;
      expv[36] = 39'h45a564cd6f;
      expv[37] = 39'h50b1cd82af;
      expv[38] = 39'h2110672bcf;
      expv[39] = 39'h2110672bcf;
      expv[40] = 39'h2110672bcf;
      expv[41] = 39'h2110672bcf;
      expv[42] = 39'h2110672bcf;
      expv[43] = 39'h2110672bcf;
      expv[44] = 39'h2110672bcf;
      expv[45] = 39'h2110672bcf;
      expv[46] = 39'h2110672bcf;
      expv[47] = 39'h2110672bcf;
      expv[48] = 39'h2110672bcf;
      expv[49] = 39'h2110672bcf;
      expv[50] = 39'h2110672bcf;
      expv[51] = 39'h2110672bcf;
      expv[52] = 39'h2110672bcf;
      expv[53] = 39'h2110672bcf;
      expv[54] = 39'h2110672bcf;
      expv[55] = 39'h2110672bcf;
      expv[56] = 39'h0110672bcf;
      expv[57] = 39'h0110672bcf;
      expv[58] = 39'h0110672bcf;
      expv[59] = 39'h400000000f;
      expv[60] = 39'h50b01b2e4f;
      expv[61] = 39'h56131a750f;
      expv[62] = 39'h56131a750f;
      expv[63] = 39'h56131a750f;
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
