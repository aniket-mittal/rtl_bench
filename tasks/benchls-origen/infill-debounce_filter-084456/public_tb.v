// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_084456 dut (
    .clk(clk),
    .rst_n(in_vec[19:19]),
    .data_in(in_vec[18:18]),
    .pol(in_vec[17:17]),
    .refclk(in_vec[16:16]),
    .flt_rise_st(in_vec[15:8]),
    .flt_fall_st(in_vec[7:0]),
    .data_out(out_vec[2:2]),
    .act_edge(out_vec[1:1]),
    .inact_edge(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h2252f;
    stim[1] = 20'h16996;
    stim[2] = 20'hea592;
    stim[3] = 20'hf4a50;
    stim[4] = 20'h83f27;
    stim[5] = 20'hfc215;
    stim[6] = 20'h80aac;
    stim[7] = 20'hf711a;
    stim[8] = 20'hd4c12;
    stim[9] = 20'h91943;
    stim[10] = 20'h8033c;
    stim[11] = 20'hb62cb;
    stim[12] = 20'he8e49;
    stim[13] = 20'hc847d;
    stim[14] = 20'hc2f59;
    stim[15] = 20'haa347;
    stim[16] = 20'hbc0d7;
    stim[17] = 20'h68842;
    stim[18] = 20'h80498;
    stim[19] = 20'hbf83f;
    stim[20] = 20'hdeeb5;
    stim[21] = 20'hbde98;
    stim[22] = 20'hfca5f;
    stim[23] = 20'h804d3;
    stim[24] = 20'he47e1;
    stim[25] = 20'hb287a;
    stim[26] = 20'he4766;
    stim[27] = 20'hd7e54;
    stim[28] = 20'hb5de3;
    stim[29] = 20'ha692e;
    stim[30] = 20'hb0f83;
    stim[31] = 20'h9db09;
    stim[32] = 20'hff3dc;
    stim[33] = 20'hc9633;
    stim[34] = 20'hfdbdb;
    stim[35] = 20'hfcf8e;
    stim[36] = 20'hb34cd;
    stim[37] = 20'hfc60c;
    stim[38] = 20'hd64bc;
    stim[39] = 20'he6049;
    stim[40] = 20'hc1d98;
    stim[41] = 20'hf4932;
    stim[42] = 20'hb0e3e;
    stim[43] = 20'h9e8b1;
    stim[44] = 20'hd33bb;
    stim[45] = 20'h82888;
    stim[46] = 20'hd6dd5;
    stim[47] = 20'hc41d3;
    stim[48] = 20'hcf114;
    stim[49] = 20'hdfc51;
    stim[50] = 20'h80af4;
    stim[51] = 20'hec6f3;
    stim[52] = 20'h81c7d;
    stim[53] = 20'hda090;
    stim[54] = 20'hcbafc;
    stim[55] = 20'h0e584;
    stim[56] = 20'heece2;
    stim[57] = 20'hcc6fd;
    stim[58] = 20'hde9bc;
    stim[59] = 20'ha2fbe;
    stim[60] = 20'hdba67;
    stim[61] = 20'h9486d;
    stim[62] = 20'h94cd6;
    stim[63] = 20'ha4288;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
