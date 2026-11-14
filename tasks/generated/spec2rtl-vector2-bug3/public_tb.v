// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h73ee4884;
    stim[1] = 32'hf2e9d2ad;
    stim[2] = 32'h5b1f391d;
    stim[3] = 32'hdba3a795;
    stim[4] = 32'h07da5abe;
    stim[5] = 32'hc7f9e209;
    stim[6] = 32'h00956c02;
    stim[7] = 32'h88890cad;
    stim[8] = 32'hcb0615e9;
    stim[9] = 32'h5d4e6254;
    stim[10] = 32'h5460c19e;
    stim[11] = 32'h2f14a4a4;
    stim[12] = 32'h3b1b3b6e;
    stim[13] = 32'ha3fcf39e;
    stim[14] = 32'hba62f49d;
    stim[15] = 32'h75d3f63b;
    stim[16] = 32'h0419b780;
    stim[17] = 32'h9ebef00d;
    stim[18] = 32'hb08a5533;
    stim[19] = 32'h615b63d6;
    stim[20] = 32'h3aeb558d;
    stim[21] = 32'h56ebf76e;
    stim[22] = 32'h4a50caba;
    stim[23] = 32'h703c80dc;
    stim[24] = 32'h0c913dd2;
    stim[25] = 32'h6e84b690;
    stim[26] = 32'h1ac1b2bf;
    stim[27] = 32'h487e74f7;
    stim[28] = 32'hbe4d97f3;
    stim[29] = 32'hf7a6cfe8;
    stim[30] = 32'h3ae66ef0;
    stim[31] = 32'h02b86f3b;
    stim[32] = 32'h741f329c;
    stim[33] = 32'h7005f20c;
    stim[34] = 32'h11af07af;
    stim[35] = 32'hf1ffc702;
    stim[36] = 32'hfccfa613;
    stim[37] = 32'h111329c9;
    stim[38] = 32'h1e59240a;
    stim[39] = 32'h6bbbcd85;
    stim[40] = 32'hf415882a;
    stim[41] = 32'h1526d9b6;
    stim[42] = 32'hadbcddfd;
    stim[43] = 32'hf47572b8;
    stim[44] = 32'h673816e3;
    stim[45] = 32'hf23e6960;
    stim[46] = 32'h33576374;
    stim[47] = 32'h5239974e;
    stim[48] = 32'hb2c5876d;
    stim[49] = 32'h59ff6d7c;
    stim[50] = 32'he702eba1;
    stim[51] = 32'h18b6c7b5;
    stim[52] = 32'h510532e2;
    stim[53] = 32'h8d09437d;
    stim[54] = 32'h35feb9fb;
    stim[55] = 32'hb5d10975;
    stim[56] = 32'hd39de492;
    stim[57] = 32'hc3902d22;
    stim[58] = 32'h94fc7e05;
    stim[59] = 32'hef2f222e;
    stim[60] = 32'h6cd05a64;
    stim[61] = 32'h3f2309a4;
    stim[62] = 32'h3b5e46ad;
    stim[63] = 32'h8c91980b;
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
      expv[0] = 32'h8448ee00;
      expv[1] = 32'hadd2e900;
      expv[2] = 32'h1d391f00;
      expv[3] = 32'h95a7a300;
      expv[4] = 32'hbe5ada00;
      expv[5] = 32'h09e2f900;
      expv[6] = 32'h026c9500;
      expv[7] = 32'had0c8900;
      expv[8] = 32'he9150600;
      expv[9] = 32'h54624e00;
      expv[10] = 32'h9ec16000;
      expv[11] = 32'ha4a41400;
      expv[12] = 32'h6e3b1b00;
      expv[13] = 32'h9ef3fc00;
      expv[14] = 32'h9df46200;
      expv[15] = 32'h3bf6d300;
      expv[16] = 32'h80b71900;
      expv[17] = 32'h0df0be00;
      expv[18] = 32'h33558a00;
      expv[19] = 32'hd6635b00;
      expv[20] = 32'h8d55eb00;
      expv[21] = 32'h6ef7eb00;
      expv[22] = 32'hbaca5000;
      expv[23] = 32'hdc803c00;
      expv[24] = 32'hd23d9100;
      expv[25] = 32'h90b68400;
      expv[26] = 32'hbfb2c100;
      expv[27] = 32'hf7747e00;
      expv[28] = 32'hf3974d00;
      expv[29] = 32'he8cfa600;
      expv[30] = 32'hf06ee600;
      expv[31] = 32'h3b6fb800;
      expv[32] = 32'h9c321f00;
      expv[33] = 32'h0cf20500;
      expv[34] = 32'haf07af00;
      expv[35] = 32'h02c7ff00;
      expv[36] = 32'h13a6cf00;
      expv[37] = 32'hc9291300;
      expv[38] = 32'h0a245900;
      expv[39] = 32'h85cdbb00;
      expv[40] = 32'h2a881500;
      expv[41] = 32'hb6d92600;
      expv[42] = 32'hfdddbc00;
      expv[43] = 32'hb8727500;
      expv[44] = 32'he3163800;
      expv[45] = 32'h60693e00;
      expv[46] = 32'h74635700;
      expv[47] = 32'h4e973900;
      expv[48] = 32'h6d87c500;
      expv[49] = 32'h7c6dff00;
      expv[50] = 32'ha1eb0200;
      expv[51] = 32'hb5c7b600;
      expv[52] = 32'he2320500;
      expv[53] = 32'h7d430900;
      expv[54] = 32'hfbb9fe00;
      expv[55] = 32'h7509d100;
      expv[56] = 32'h92e49d00;
      expv[57] = 32'h222d9000;
      expv[58] = 32'h057efc00;
      expv[59] = 32'h2e222f00;
      expv[60] = 32'h645ad000;
      expv[61] = 32'ha4092300;
      expv[62] = 32'had465e00;
      expv[63] = 32'h0b989100;
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
