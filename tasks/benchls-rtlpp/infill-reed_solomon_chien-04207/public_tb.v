// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04207 dut (
    .clk(clk),
    .DIN(in_vec[23:0]),
    .DOUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h7ec18d;
    stim[1] = 24'h2f008b;
    stim[2] = 24'he3b49a;
    stim[3] = 24'h047f21;
    stim[4] = 24'hf04bac;
    stim[5] = 24'h6f0f1a;
    stim[6] = 24'h1352b8;
    stim[7] = 24'h337713;
    stim[8] = 24'h61078f;
    stim[9] = 24'h41f8df;
    stim[10] = 24'ha75694;
    stim[11] = 24'hdd9214;
    stim[12] = 24'hd147ad;
    stim[13] = 24'h790552;
    stim[14] = 24'hc4694e;
    stim[15] = 24'hd9db8c;
    stim[16] = 24'hd3199d;
    stim[17] = 24'hc80ce2;
    stim[18] = 24'hc3d496;
    stim[19] = 24'he97cc7;
    stim[20] = 24'h398502;
    stim[21] = 24'h637964;
    stim[22] = 24'h0876e8;
    stim[23] = 24'h4aaf4e;
    stim[24] = 24'h8cb068;
    stim[25] = 24'hf2b060;
    stim[26] = 24'h049f60;
    stim[27] = 24'he209bb;
    stim[28] = 24'h7b23c5;
    stim[29] = 24'hcdae56;
    stim[30] = 24'h96fc8d;
    stim[31] = 24'hf80271;
    stim[32] = 24'ha0303d;
    stim[33] = 24'he4b8b3;
    stim[34] = 24'h4d322e;
    stim[35] = 24'hc377a9;
    stim[36] = 24'h2fe1a2;
    stim[37] = 24'h81bab3;
    stim[38] = 24'he41cc7;
    stim[39] = 24'hc0c868;
    stim[40] = 24'h27d279;
    stim[41] = 24'hd142e9;
    stim[42] = 24'h023ab0;
    stim[43] = 24'h1b7940;
    stim[44] = 24'h59fa99;
    stim[45] = 24'h92148a;
    stim[46] = 24'hf070bb;
    stim[47] = 24'h4421ec;
    stim[48] = 24'hcba981;
    stim[49] = 24'h86b7f3;
    stim[50] = 24'he0eded;
    stim[51] = 24'h51cfd5;
    stim[52] = 24'h7de384;
    stim[53] = 24'h67df3e;
    stim[54] = 24'h07ccf9;
    stim[55] = 24'hdb09b1;
    stim[56] = 24'h765937;
    stim[57] = 24'h9ca8ed;
    stim[58] = 24'hb1ff7b;
    stim[59] = 24'h6c91c4;
    stim[60] = 24'hff68a7;
    stim[61] = 24'h707fb0;
    stim[62] = 24'h0de2fa;
    stim[63] = 24'h77ad8b;
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
      expv[3] = 8'hef;
      expv[4] = 8'hd9;
      expv[5] = 8'hfd;
      expv[6] = 8'ha2;
      expv[7] = 8'hfe;
      expv[8] = 8'hed;
      expv[9] = 8'hc4;
      expv[10] = 8'hdb;
      expv[11] = 8'he9;
      expv[12] = 8'he0;
      expv[13] = 8'hf6;
      expv[14] = 8'hfd;
      expv[15] = 8'hfb;
      expv[16] = 8'hee;
      expv[17] = 8'hfa;
      expv[18] = 8'hfc;
      expv[19] = 8'hfb;
      expv[20] = 8'hfa;
      expv[21] = 8'hf9;
      expv[22] = 8'hfe;
      expv[23] = 8'hdd;
      expv[24] = 8'hea;
      expv[25] = 8'hb1;
      expv[26] = 8'he3;
      expv[27] = 8'hf2;
      expv[28] = 8'hfe;
      expv[29] = 8'ha3;
      expv[30] = 8'hfd;
      expv[31] = 8'hef;
      expv[32] = 8'hfb;
      expv[33] = 8'hf3;
      expv[34] = 8'hff;
      expv[35] = 8'hf5;
      expv[36] = 8'hfd;
      expv[37] = 8'he4;
      expv[38] = 8'hf9;
      expv[39] = 8'hd9;
      expv[40] = 8'hf0;
      expv[41] = 8'hfd;
      expv[42] = 8'hf9;
      expv[43] = 8'hd5;
      expv[44] = 8'hfb;
      expv[45] = 8'h92;
      expv[46] = 8'hcc;
      expv[47] = 8'he7;
      expv[48] = 8'hf3;
      expv[49] = 8'hfe;
      expv[50] = 8'he1;
      expv[51] = 8'hfa;
      expv[52] = 8'hf1;
      expv[53] = 8'hfd;
      expv[54] = 8'he5;
      expv[55] = 8'hef;
      expv[56] = 8'heb;
      expv[57] = 8'haf;
      expv[58] = 8'hfc;
      expv[59] = 8'hee;
      expv[60] = 8'hf5;
      expv[61] = 8'hf7;
      expv[62] = 8'hec;
      expv[63] = 8'hff;
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
