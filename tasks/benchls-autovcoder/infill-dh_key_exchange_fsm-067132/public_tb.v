// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_067132 dut (
    .CLK(clk),
    .LED(in_vec[7:0]),
    .out(out_vec[8:5]),
    .out2(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h20;
    stim[1] = 8'hd2;
    stim[2] = 8'h8b;
    stim[3] = 8'h44;
    stim[4] = 8'h71;
    stim[5] = 8'ha6;
    stim[6] = 8'he5;
    stim[7] = 8'h07;
    stim[8] = 8'hb1;
    stim[9] = 8'h97;
    stim[10] = 8'hae;
    stim[11] = 8'had;
    stim[12] = 8'h36;
    stim[13] = 8'h15;
    stim[14] = 8'h55;
    stim[15] = 8'h91;
    stim[16] = 8'haf;
    stim[17] = 8'h47;
    stim[18] = 8'h60;
    stim[19] = 8'h81;
    stim[20] = 8'h0e;
    stim[21] = 8'h01;
    stim[22] = 8'h27;
    stim[23] = 8'ha2;
    stim[24] = 8'hd6;
    stim[25] = 8'hfc;
    stim[26] = 8'hb8;
    stim[27] = 8'ha3;
    stim[28] = 8'h2e;
    stim[29] = 8'h11;
    stim[30] = 8'h9a;
    stim[31] = 8'h63;
    stim[32] = 8'h30;
    stim[33] = 8'h52;
    stim[34] = 8'h10;
    stim[35] = 8'ha5;
    stim[36] = 8'h02;
    stim[37] = 8'h7d;
    stim[38] = 8'h0c;
    stim[39] = 8'h8c;
    stim[40] = 8'h39;
    stim[41] = 8'h22;
    stim[42] = 8'h41;
    stim[43] = 8'h36;
    stim[44] = 8'h6d;
    stim[45] = 8'h64;
    stim[46] = 8'h7e;
    stim[47] = 8'h58;
    stim[48] = 8'h58;
    stim[49] = 8'h28;
    stim[50] = 8'h70;
    stim[51] = 8'h6e;
    stim[52] = 8'h56;
    stim[53] = 8'h32;
    stim[54] = 8'hf7;
    stim[55] = 8'h91;
    stim[56] = 8'hee;
    stim[57] = 8'h79;
    stim[58] = 8'h10;
    stim[59] = 8'h7c;
    stim[60] = 8'h85;
    stim[61] = 8'h0c;
    stim[62] = 8'h4b;
    stim[63] = 8'hb3;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'hxxx;
      expv[15] = 9'hxxx;
      expv[16] = 9'hxxx;
      expv[17] = 9'hxxx;
      expv[18] = 9'hxxx;
      expv[19] = 9'hxxx;
      expv[20] = 9'hxxx;
      expv[21] = 9'hxxx;
      expv[22] = 9'hxxx;
      expv[23] = 9'hxxx;
      expv[24] = 9'hxxx;
      expv[25] = 9'hxxx;
      expv[26] = 9'hxxx;
      expv[27] = 9'hxxx;
      expv[28] = 9'hxxx;
      expv[29] = 9'hxxx;
      expv[30] = 9'hxxx;
      expv[31] = 9'hxxx;
      expv[32] = 9'hxxx;
      expv[33] = 9'hxxx;
      expv[34] = 9'hxxx;
      expv[35] = 9'hxxx;
      expv[36] = 9'hxxx;
      expv[37] = 9'hxxx;
      expv[38] = 9'hxxx;
      expv[39] = 9'hxxx;
      expv[40] = 9'hxxx;
      expv[41] = 9'hxxx;
      expv[42] = 9'hxxx;
      expv[43] = 9'hxxx;
      expv[44] = 9'hxxx;
      expv[45] = 9'hxxx;
      expv[46] = 9'hxxx;
      expv[47] = 9'hxxx;
      expv[48] = 9'hxxx;
      expv[49] = 9'hxxx;
      expv[50] = 9'hxxx;
      expv[51] = 9'hxxx;
      expv[52] = 9'hxxx;
      expv[53] = 9'hxxx;
      expv[54] = 9'h00d;
      expv[55] = 9'h00d;
      expv[56] = 9'h00d;
      expv[57] = 9'h00d;
      expv[58] = 9'h00d;
      expv[59] = 9'h00d;
      expv[60] = 9'h00d;
      expv[61] = 9'h00d;
      expv[62] = 9'h00d;
      expv[63] = 9'h00d;
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
