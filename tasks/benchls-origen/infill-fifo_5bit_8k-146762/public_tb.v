// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146762 dut (
    .clk(clk),
    .ram_full_fb_i_reg(in_vec[6:6]),
    .tmp_ram_rd_en(in_vec[5:5]),
    .din(in_vec[4:0]),
    .Q(out_vec[5:5]),
    .D(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h64;
    stim[1] = 7'h17;
    stim[2] = 7'h68;
    stim[3] = 7'h2b;
    stim[4] = 7'h7a;
    stim[5] = 7'h07;
    stim[6] = 7'h21;
    stim[7] = 7'h4b;
    stim[8] = 7'h1b;
    stim[9] = 7'h67;
    stim[10] = 7'h49;
    stim[11] = 7'h71;
    stim[12] = 7'h38;
    stim[13] = 7'h2a;
    stim[14] = 7'h2b;
    stim[15] = 7'h44;
    stim[16] = 7'h7d;
    stim[17] = 7'h3a;
    stim[18] = 7'h37;
    stim[19] = 7'h35;
    stim[20] = 7'h42;
    stim[21] = 7'h60;
    stim[22] = 7'h1f;
    stim[23] = 7'h26;
    stim[24] = 7'h57;
    stim[25] = 7'h1c;
    stim[26] = 7'h6b;
    stim[27] = 7'h72;
    stim[28] = 7'h7d;
    stim[29] = 7'h33;
    stim[30] = 7'h60;
    stim[31] = 7'h28;
    stim[32] = 7'h21;
    stim[33] = 7'h1d;
    stim[34] = 7'h07;
    stim[35] = 7'h25;
    stim[36] = 7'h3c;
    stim[37] = 7'h0b;
    stim[38] = 7'h45;
    stim[39] = 7'h3a;
    stim[40] = 7'h24;
    stim[41] = 7'h07;
    stim[42] = 7'h6e;
    stim[43] = 7'h63;
    stim[44] = 7'h72;
    stim[45] = 7'h63;
    stim[46] = 7'h0b;
    stim[47] = 7'h74;
    stim[48] = 7'h23;
    stim[49] = 7'h1f;
    stim[50] = 7'h02;
    stim[51] = 7'h3e;
    stim[52] = 7'h5b;
    stim[53] = 7'h48;
    stim[54] = 7'h2c;
    stim[55] = 7'h74;
    stim[56] = 7'h44;
    stim[57] = 7'h6e;
    stim[58] = 7'h37;
    stim[59] = 7'h48;
    stim[60] = 7'h0b;
    stim[61] = 7'h12;
    stim[62] = 7'h47;
    stim[63] = 7'h4c;
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
      expv[0] = 6'hxx;
      expv[1] = 6'hxx;
      expv[2] = 6'hxx;
      expv[3] = 6'h37;
      expv[4] = 6'h17;
      expv[5] = 6'h2b;
      expv[6] = 6'h0b;
      expv[7] = 6'h27;
      expv[8] = 6'h27;
      expv[9] = 6'h27;
      expv[10] = 6'h21;
      expv[11] = 6'h21;
      expv[12] = 6'h3b;
      expv[13] = 6'hxx;
      expv[14] = 6'hxx;
      expv[15] = 6'hxx;
      expv[16] = 6'hxx;
      expv[17] = 6'hxx;
      expv[18] = 6'hxx;
      expv[19] = 6'hxx;
      expv[20] = 6'hxx;
      expv[21] = 6'hxx;
      expv[22] = 6'hxx;
      expv[23] = 6'hxx;
      expv[24] = 6'h3f;
      expv[25] = 6'h1f;
      expv[26] = 6'h1f;
      expv[27] = 6'h26;
      expv[28] = 6'h06;
      expv[29] = 6'h06;
      expv[30] = 6'h06;
      expv[31] = 6'h3c;
      expv[32] = 6'h1c;
      expv[33] = 6'h33;
      expv[34] = 6'h33;
      expv[35] = 6'h33;
      expv[36] = 6'h28;
      expv[37] = 6'h21;
      expv[38] = 6'h21;
      expv[39] = 6'h21;
      expv[40] = 6'h3d;
      expv[41] = 6'h27;
      expv[42] = 6'h27;
      expv[43] = 6'h25;
      expv[44] = 6'h3c;
      expv[45] = 6'h2b;
      expv[46] = 6'h3a;
      expv[47] = 6'h3a;
      expv[48] = 6'h24;
      expv[49] = 6'h27;
      expv[50] = 6'h27;
      expv[51] = 6'h27;
      expv[52] = 6'h2b;
      expv[53] = 6'h2b;
      expv[54] = 6'h2b;
      expv[55] = 6'h23;
      expv[56] = 6'h3f;
      expv[57] = 6'h3f;
      expv[58] = 6'h22;
      expv[59] = 6'h3e;
      expv[60] = 6'h3e;
      expv[61] = 6'h3e;
      expv[62] = 6'h3e;
      expv[63] = 6'h3e;
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
