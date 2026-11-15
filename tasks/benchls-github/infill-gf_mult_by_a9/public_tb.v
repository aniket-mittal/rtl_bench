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

  gf_mult_by_a9 dut (
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
    stim[0] = 8'h1a;
    stim[1] = 8'ha0;
    stim[2] = 8'hd6;
    stim[3] = 8'hb3;
    stim[4] = 8'h3c;
    stim[5] = 8'h47;
    stim[6] = 8'h81;
    stim[7] = 8'h44;
    stim[8] = 8'hfe;
    stim[9] = 8'hd2;
    stim[10] = 8'ha7;
    stim[11] = 8'hd9;
    stim[12] = 8'h08;
    stim[13] = 8'h78;
    stim[14] = 8'h03;
    stim[15] = 8'h2c;
    stim[16] = 8'h0d;
    stim[17] = 8'h62;
    stim[18] = 8'h29;
    stim[19] = 8'h32;
    stim[20] = 8'hd5;
    stim[21] = 8'h86;
    stim[22] = 8'h83;
    stim[23] = 8'hd4;
    stim[24] = 8'h83;
    stim[25] = 8'h24;
    stim[26] = 8'hd1;
    stim[27] = 8'h84;
    stim[28] = 8'hf4;
    stim[29] = 8'h6b;
    stim[30] = 8'hba;
    stim[31] = 8'h55;
    stim[32] = 8'h20;
    stim[33] = 8'h58;
    stim[34] = 8'h7d;
    stim[35] = 8'h6d;
    stim[36] = 8'hd0;
    stim[37] = 8'hc5;
    stim[38] = 8'h90;
    stim[39] = 8'h55;
    stim[40] = 8'h11;
    stim[41] = 8'he1;
    stim[42] = 8'hec;
    stim[43] = 8'h02;
    stim[44] = 8'h87;
    stim[45] = 8'ha2;
    stim[46] = 8'hc3;
    stim[47] = 8'h9a;
    stim[48] = 8'h2d;
    stim[49] = 8'h4a;
    stim[50] = 8'h13;
    stim[51] = 8'ha8;
    stim[52] = 8'hc9;
    stim[53] = 8'hca;
    stim[54] = 8'h47;
    stim[55] = 8'h3b;
    stim[56] = 8'h3b;
    stim[57] = 8'h33;
    stim[58] = 8'h58;
    stim[59] = 8'h3f;
    stim[60] = 8'h64;
    stim[61] = 8'ha4;
    stim[62] = 8'hef;
    stim[63] = 8'h27;
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
      expv[0] = 8'h2c;
      expv[1] = 8'hae;
      expv[2] = 8'hac;
      expv[3] = 8'h0a;
      expv[4] = 8'h79;
      expv[5] = 8'h6d;
      expv[6] = 8'h83;
      expv[7] = 8'h8b;
      expv[8] = 8'h09;
      expv[9] = 8'h32;
      expv[10] = 8'hd6;
      expv[11] = 8'hf5;
      expv[12] = 8'h21;
      expv[13] = 8'hf2;
      expv[14] = 8'he6;
      expv[15] = 8'h3b;
      expv[16] = 8'h16;
      expv[17] = 8'hde;
      expv[18] = 8'h0c;
      expv[19] = 8'h89;
      expv[20] = 8'h4a;
      expv[21] = 8'hfb;
      expv[22] = 8'hcc;
      expv[23] = 8'he3;
      expv[24] = 8'hcc;
      expv[25] = 8'h1a;
      expv[26] = 8'hd4;
      expv[27] = 8'hb4;
      expv[28] = 8'h67;
      expv[29] = 8'h56;
      expv[30] = 8'h82;
      expv[31] = 8'h60;
      expv[32] = 8'h84;
      expv[33] = 8'h76;
      expv[34] = 8'hc5;
      expv[35] = 8'h87;
      expv[36] = 8'h7d;
      expv[37] = 8'h08;
      expv[38] = 8'h68;
      expv[39] = 8'h60;
      expv[40] = 8'heb;
      expv[41] = 8'h12;
      expv[42] = 8'h04;
      expv[43] = 8'h4f;
      expv[44] = 8'h52;
      expv[45] = 8'he1;
      expv[46] = 8'hd9;
      expv[47] = 8'h06;
      expv[48] = 8'h92;
      expv[49] = 8'h7b;
      expv[50] = 8'ha4;
      expv[51] = 8'h8f;
      expv[52] = 8'hb7;
      expv[53] = 8'h51;
      expv[54] = 8'h6d;
      expv[55] = 8'h01;
      expv[56] = 8'h01;
      expv[57] = 8'h20;
      expv[58] = 8'h76;
      expv[59] = 8'h9f;
      expv[60] = 8'h0f;
      expv[61] = 8'h30;
      expv[62] = 8'he2;
      expv[63] = 8'hfc;
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
