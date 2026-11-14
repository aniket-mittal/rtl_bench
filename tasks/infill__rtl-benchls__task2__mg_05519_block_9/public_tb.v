// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05519 dut (
    .HCLK(clk),
    .HRESETn(in_vec[6:6]),
    .HREADYin(in_vec[5:5]),
    .HREADYout(in_vec[4:4]),
    .HWRITEin(in_vec[3:3]),
    .HWRITEout(in_vec[2:2]),
    .HSEL(in_vec[1:1]),
    .HGRANT(in_vec[0:0]),
    .MAPSn(out_vec[4:4]),
    .MDPSn(out_vec[3:3]),
    .DENn(out_vec[2:2]),
    .SDPSn(out_vec[1:1]),
    .SRSn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h23;
    stim[1] = 7'h05;
    stim[2] = 7'h56;
    stim[3] = 7'h71;
    stim[4] = 7'h48;
    stim[5] = 7'h47;
    stim[6] = 7'h64;
    stim[7] = 7'h62;
    stim[8] = 7'h54;
    stim[9] = 7'h5e;
    stim[10] = 7'h65;
    stim[11] = 7'h4f;
    stim[12] = 7'h58;
    stim[13] = 7'h11;
    stim[14] = 7'h56;
    stim[15] = 7'h52;
    stim[16] = 7'h63;
    stim[17] = 7'h75;
    stim[18] = 7'h5f;
    stim[19] = 7'h74;
    stim[20] = 7'h45;
    stim[21] = 7'h5b;
    stim[22] = 7'h55;
    stim[23] = 7'h59;
    stim[24] = 7'h64;
    stim[25] = 7'h70;
    stim[26] = 7'h58;
    stim[27] = 7'h7b;
    stim[28] = 7'h7a;
    stim[29] = 7'h4b;
    stim[30] = 7'h41;
    stim[31] = 7'h40;
    stim[32] = 7'h5f;
    stim[33] = 7'h54;
    stim[34] = 7'h57;
    stim[35] = 7'h5f;
    stim[36] = 7'h68;
    stim[37] = 7'h4d;
    stim[38] = 7'h66;
    stim[39] = 7'h7f;
    stim[40] = 7'h68;
    stim[41] = 7'h4a;
    stim[42] = 7'h68;
    stim[43] = 7'h7f;
    stim[44] = 7'h73;
    stim[45] = 7'h5b;
    stim[46] = 7'h58;
    stim[47] = 7'h59;
    stim[48] = 7'h41;
    stim[49] = 7'h6a;
    stim[50] = 7'h77;
    stim[51] = 7'h44;
    stim[52] = 7'h6c;
    stim[53] = 7'h65;
    stim[54] = 7'h61;
    stim[55] = 7'h45;
    stim[56] = 7'h4f;
    stim[57] = 7'h59;
    stim[58] = 7'h59;
    stim[59] = 7'h6c;
    stim[60] = 7'h50;
    stim[61] = 7'h6b;
    stim[62] = 7'h4e;
    stim[63] = 7'h67;
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
      expv[0] = 5'h1e;
      expv[1] = 5'h1e;
      expv[2] = 5'h1e;
      expv[3] = 5'h1e;
      expv[4] = 5'h0f;
      expv[5] = 5'h1f;
      expv[6] = 5'h0f;
      expv[7] = 5'h13;
      expv[8] = 5'h18;
      expv[9] = 5'h18;
      expv[10] = 5'h18;
      expv[11] = 5'h0f;
      expv[12] = 5'h0f;
      expv[13] = 5'h1e;
      expv[14] = 5'h1e;
      expv[15] = 5'h1e;
      expv[16] = 5'h1e;
      expv[17] = 5'h08;
      expv[18] = 5'h03;
      expv[19] = 5'h03;
      expv[20] = 5'h13;
      expv[21] = 5'h03;
      expv[22] = 5'h03;
      expv[23] = 5'h03;
      expv[24] = 5'h03;
      expv[25] = 5'h13;
      expv[26] = 5'h1f;
      expv[27] = 5'h1f;
      expv[28] = 5'h0e;
      expv[29] = 5'h1e;
      expv[30] = 5'h0e;
      expv[31] = 5'h0e;
      expv[32] = 5'h1e;
      expv[33] = 5'h0e;
      expv[34] = 5'h1e;
      expv[35] = 5'h0e;
      expv[36] = 5'h0e;
      expv[37] = 5'h1f;
      expv[38] = 5'h0f;
      expv[39] = 5'h10;
      expv[40] = 5'h0e;
      expv[41] = 5'h1f;
      expv[42] = 5'h1f;
      expv[43] = 5'h1f;
      expv[44] = 5'h0e;
      expv[45] = 5'h08;
      expv[46] = 5'h08;
      expv[47] = 5'h18;
      expv[48] = 5'h08;
      expv[49] = 5'h08;
      expv[50] = 5'h1e;
      expv[51] = 5'h08;
      expv[52] = 5'h18;
      expv[53] = 5'h1f;
      expv[54] = 5'h0f;
      expv[55] = 5'h0f;
      expv[56] = 5'h0f;
      expv[57] = 5'h0f;
      expv[58] = 5'h0f;
      expv[59] = 5'h0f;
      expv[60] = 5'h13;
      expv[61] = 5'h13;
      expv[62] = 5'h0e;
      expv[63] = 5'h1e;
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
