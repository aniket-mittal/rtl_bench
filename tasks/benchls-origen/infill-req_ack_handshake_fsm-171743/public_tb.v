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

  origen_171743 dut (
    .clk(clk),
    .clr(in_vec[7:7]),
    .req(in_vec[6:6]),
    .data_in(in_vec[5:0]),
    .ack(out_vec[7:7]),
    .complete(out_vec[6:6]),
    .data_out(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h79;
    stim[1] = 8'h7a;
    stim[2] = 8'haf;
    stim[3] = 8'hf1;
    stim[4] = 8'hee;
    stim[5] = 8'haa;
    stim[6] = 8'hd2;
    stim[7] = 8'hd6;
    stim[8] = 8'h91;
    stim[9] = 8'hcf;
    stim[10] = 8'hb1;
    stim[11] = 8'hd6;
    stim[12] = 8'he2;
    stim[13] = 8'hf8;
    stim[14] = 8'ha8;
    stim[15] = 8'hab;
    stim[16] = 8'hca;
    stim[17] = 8'he5;
    stim[18] = 8'hf2;
    stim[19] = 8'h4d;
    stim[20] = 8'hea;
    stim[21] = 8'ha2;
    stim[22] = 8'hc1;
    stim[23] = 8'hcd;
    stim[24] = 8'hde;
    stim[25] = 8'hf7;
    stim[26] = 8'hf8;
    stim[27] = 8'hfc;
    stim[28] = 8'h9c;
    stim[29] = 8'ha1;
    stim[30] = 8'hc0;
    stim[31] = 8'hf9;
    stim[32] = 8'hd2;
    stim[33] = 8'hb4;
    stim[34] = 8'ha4;
    stim[35] = 8'ha9;
    stim[36] = 8'h9b;
    stim[37] = 8'hce;
    stim[38] = 8'hc5;
    stim[39] = 8'hae;
    stim[40] = 8'hda;
    stim[41] = 8'h95;
    stim[42] = 8'haf;
    stim[43] = 8'hc3;
    stim[44] = 8'hb9;
    stim[45] = 8'hf4;
    stim[46] = 8'h9b;
    stim[47] = 8'h8b;
    stim[48] = 8'h7c;
    stim[49] = 8'ha5;
    stim[50] = 8'h9d;
    stim[51] = 8'hc9;
    stim[52] = 8'hc2;
    stim[53] = 8'h85;
    stim[54] = 8'h80;
    stim[55] = 8'hf3;
    stim[56] = 8'he5;
    stim[57] = 8'ha3;
    stim[58] = 8'hfc;
    stim[59] = 8'hdc;
    stim[60] = 8'h91;
    stim[61] = 8'hb3;
    stim[62] = 8'ha4;
    stim[63] = 8'ha9;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'h6e;
      expv[5] = 8'hae;
      expv[6] = 8'h2e;
      expv[7] = 8'h56;
      expv[8] = 8'h96;
      expv[9] = 8'h16;
      expv[10] = 8'h71;
      expv[11] = 8'hb1;
      expv[12] = 8'hb1;
      expv[13] = 8'hb1;
      expv[14] = 8'hb1;
      expv[15] = 8'h31;
      expv[16] = 8'h31;
      expv[17] = 8'h65;
      expv[18] = 8'ha5;
      expv[19] = 8'h25;
      expv[20] = 8'h25;
      expv[21] = 8'h62;
      expv[22] = 8'ha2;
      expv[23] = 8'ha2;
      expv[24] = 8'ha2;
      expv[25] = 8'ha2;
      expv[26] = 8'ha2;
      expv[27] = 8'ha2;
      expv[28] = 8'ha2;
      expv[29] = 8'h22;
      expv[30] = 8'h22;
      expv[31] = 8'h79;
      expv[32] = 8'hb9;
      expv[33] = 8'hb9;
      expv[34] = 8'h39;
      expv[35] = 8'h39;
      expv[36] = 8'h39;
      expv[37] = 8'h39;
      expv[38] = 8'h45;
      expv[39] = 8'h85;
      expv[40] = 8'h05;
      expv[41] = 8'h55;
      expv[42] = 8'h95;
      expv[43] = 8'h15;
      expv[44] = 8'h79;
      expv[45] = 8'hb9;
      expv[46] = 8'hb9;
      expv[47] = 8'h39;
      expv[48] = 8'h39;
      expv[49] = 8'h39;
      expv[50] = 8'h39;
      expv[51] = 8'h39;
      expv[52] = 8'h42;
      expv[53] = 8'h82;
      expv[54] = 8'h02;
      expv[55] = 8'h02;
      expv[56] = 8'h65;
      expv[57] = 8'ha5;
      expv[58] = 8'h25;
      expv[59] = 8'h5c;
      expv[60] = 8'h9c;
      expv[61] = 8'h1c;
      expv[62] = 8'h1c;
      expv[63] = 8'h1c;
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
