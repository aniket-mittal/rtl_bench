// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_5e dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hd3;
    stim[1] = 8'h3a;
    stim[2] = 8'h78;
    stim[3] = 8'h6a;
    stim[4] = 8'hb1;
    stim[5] = 8'h17;
    stim[6] = 8'hd2;
    stim[7] = 8'h88;
    stim[8] = 8'ha4;
    stim[9] = 8'h96;
    stim[10] = 8'h3f;
    stim[11] = 8'hce;
    stim[12] = 8'h40;
    stim[13] = 8'ha3;
    stim[14] = 8'h20;
    stim[15] = 8'h30;
    stim[16] = 8'h71;
    stim[17] = 8'h10;
    stim[18] = 8'hef;
    stim[19] = 8'h41;
    stim[20] = 8'h65;
    stim[21] = 8'hfc;
    stim[22] = 8'hf6;
    stim[23] = 8'h9d;
    stim[24] = 8'h8f;
    stim[25] = 8'h7b;
    stim[26] = 8'h4c;
    stim[27] = 8'hc5;
    stim[28] = 8'h58;
    stim[29] = 8'h43;
    stim[30] = 8'h59;
    stim[31] = 8'h9e;
    stim[32] = 8'h95;
    stim[33] = 8'h66;
    stim[34] = 8'h3c;
    stim[35] = 8'h28;
    stim[36] = 8'h6a;
    stim[37] = 8'h11;
    stim[38] = 8'hce;
    stim[39] = 8'hec;
    stim[40] = 8'h00;
    stim[41] = 8'hc1;
    stim[42] = 8'hb8;
    stim[43] = 8'h8a;
    stim[44] = 8'h71;
    stim[45] = 8'h70;
    stim[46] = 8'h70;
    stim[47] = 8'h5b;
    stim[48] = 8'h09;
    stim[49] = 8'h16;
    stim[50] = 8'h88;
    stim[51] = 8'h3e;
    stim[52] = 8'h87;
    stim[53] = 8'h89;
    stim[54] = 8'h3f;
    stim[55] = 8'h29;
    stim[56] = 8'h8e;
    stim[57] = 8'h24;
    stim[58] = 8'h63;
    stim[59] = 8'h25;
    stim[60] = 8'h8b;
    stim[61] = 8'hf2;
    stim[62] = 8'h17;
    stim[63] = 8'hb6;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h49;
      expv[1] = 8'hf0;
      expv[2] = 8'h52;
      expv[3] = 8'h67;
      expv[4] = 8'he4;
      expv[5] = 8'h0e;
      expv[6] = 8'h17;
      expv[7] = 8'hf6;
      expv[8] = 8'h56;
      expv[9] = 8'h6c;
      expv[10] = 8'hcb;
      expv[11] = 8'h31;
      expv[12] = 8'h1e;
      expv[13] = 8'hd1;
      expv[14] = 8'h0f;
      expv[15] = 8'h86;
      expv[16] = 8'hc6;
      expv[17] = 8'h89;
      expv[18] = 8'h60;
      expv[19] = 8'h40;
      expv[20] = 8'h2a;
      expv[21] = 8'h0b;
      expv[22] = 8'h7d;
      expv[23] = 8'h44;
      expv[24] = 8'h71;
      expv[25] = 8'hb0;
      expv[26] = 8'hb1;
      expv[27] = 8'h19;
      expv[28] = 8'h5d;
      expv[29] = 8'hfc;
      expv[30] = 8'h03;
      expv[31] = 8'ha6;
      expv[32] = 8'h8e;
      expv[33] = 8'hc8;
      expv[34] = 8'h29;
      expv[35] = 8'hc5;
      expv[36] = 8'h67;
      expv[37] = 8'hd7;
      expv[38] = 8'h31;
      expv[39] = 8'h82;
      expv[40] = 8'h00;
      expv[41] = 8'h7c;
      expv[42] = 8'h70;
      expv[43] = 8'h4a;
      expv[44] = 8'hc6;
      expv[45] = 8'h98;
      expv[46] = 8'h98;
      expv[47] = 8'hbf;
      expv[48] = 8'h94;
      expv[49] = 8'h50;
      expv[50] = 8'hf6;
      expv[51] = 8'h95;
      expv[52] = 8'hbb;
      expv[53] = 8'ha8;
      expv[54] = 8'hcb;
      expv[55] = 8'h9b;
      expv[56] = 8'h2f;
      expv[57] = 8'h6a;
      expv[58] = 8'hf3;
      expv[59] = 8'h34;
      expv[60] = 8'h14;
      expv[61] = 8'h18;
      expv[62] = 8'h0e;
      expv[63] = 8'h63;
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
