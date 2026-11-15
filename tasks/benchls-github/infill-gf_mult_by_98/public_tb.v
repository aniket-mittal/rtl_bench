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

  gf_mult_by_98 dut (
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
    stim[0] = 8'hd4;
    stim[1] = 8'h00;
    stim[2] = 8'hf7;
    stim[3] = 8'h10;
    stim[4] = 8'h92;
    stim[5] = 8'ha6;
    stim[6] = 8'hf3;
    stim[7] = 8'h67;
    stim[8] = 8'h91;
    stim[9] = 8'h4b;
    stim[10] = 8'h3e;
    stim[11] = 8'h00;
    stim[12] = 8'ha5;
    stim[13] = 8'had;
    stim[14] = 8'h03;
    stim[15] = 8'h80;
    stim[16] = 8'h85;
    stim[17] = 8'h08;
    stim[18] = 8'h03;
    stim[19] = 8'he9;
    stim[20] = 8'haa;
    stim[21] = 8'h3d;
    stim[22] = 8'hd5;
    stim[23] = 8'h0f;
    stim[24] = 8'h5e;
    stim[25] = 8'ha1;
    stim[26] = 8'h0c;
    stim[27] = 8'hec;
    stim[28] = 8'h38;
    stim[29] = 8'hd7;
    stim[30] = 8'hdd;
    stim[31] = 8'hbb;
    stim[32] = 8'h69;
    stim[33] = 8'h24;
    stim[34] = 8'h72;
    stim[35] = 8'he0;
    stim[36] = 8'h97;
    stim[37] = 8'hd0;
    stim[38] = 8'h1e;
    stim[39] = 8'h33;
    stim[40] = 8'h2a;
    stim[41] = 8'h58;
    stim[42] = 8'h5f;
    stim[43] = 8'h00;
    stim[44] = 8'h3e;
    stim[45] = 8'h34;
    stim[46] = 8'he6;
    stim[47] = 8'hdd;
    stim[48] = 8'hbd;
    stim[49] = 8'hcc;
    stim[50] = 8'h86;
    stim[51] = 8'h78;
    stim[52] = 8'hac;
    stim[53] = 8'h43;
    stim[54] = 8'hfe;
    stim[55] = 8'he8;
    stim[56] = 8'h53;
    stim[57] = 8'h48;
    stim[58] = 8'h1b;
    stim[59] = 8'h6b;
    stim[60] = 8'h08;
    stim[61] = 8'hb1;
    stim[62] = 8'h4c;
    stim[63] = 8'h87;
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
      expv[0] = 8'h69;
      expv[1] = 8'h00;
      expv[2] = 8'h36;
      expv[3] = 8'h75;
      expv[4] = 8'hd7;
      expv[5] = 8'h12;
      expv[6] = 8'h6c;
      expv[7] = 8'hcc;
      expv[8] = 8'h62;
      expv[9] = 8'hc8;
      expv[10] = 8'h5c;
      expv[11] = 8'h00;
      expv[12] = 8'ha7;
      expv[13] = 8'h13;
      expv[14] = 8'hb5;
      expv[15] = 8'h8f;
      expv[16] = 8'h4d;
      expv[17] = 8'hb4;
      expv[18] = 8'hb5;
      expv[19] = 8'h80;
      expv[20] = 8'hfc;
      expv[21] = 8'he9;
      expv[22] = 8'hf1;
      expv[23] = 8'h5b;
      expv[24] = 8'h7f;
      expv[25] = 8'hfd;
      expv[26] = 8'hee;
      expv[27] = 8'h42;
      expv[28] = 8'h2b;
      expv[29] = 8'hdc;
      expv[30] = 8'h45;
      expv[31] = 8'h11;
      expv[32] = 8'h0f;
      expv[33] = 8'hb0;
      expv[34] = 8'h7b;
      expv[35] = 8'hac;
      expv[36] = 8'h15;
      expv[37] = 8'h33;
      expv[38] = 8'hb6;
      expv[39] = 8'h2a;
      expv[40] = 8'h73;
      expv[41] = 8'h08;
      expv[42] = 8'he7;
      expv[43] = 8'h00;
      expv[44] = 8'h5c;
      expv[45] = 8'hc5;
      expv[46] = 8'hdb;
      expv[47] = 8'h45;
      expv[48] = 8'h66;
      expv[49] = 8'ha8;
      expv[50] = 8'hf8;
      expv[51] = 8'he2;
      expv[52] = 8'h8b;
      expv[53] = 8'h7c;
      expv[54] = 8'h1a;
      expv[55] = 8'h18;
      expv[56] = 8'h09;
      expv[57] = 8'h7d;
      expv[58] = 8'h74;
      expv[59] = 8'h22;
      expv[60] = 8'hb4;
      expv[61] = 8'h88;
      expv[62] = 8'h27;
      expv[63] = 8'h60;
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
