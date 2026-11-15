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

  origen_032566 dut (
    .clk(clk),
    .reset(in_vec[7:7]),
    .nt(in_vec[6:6]),
    .xi(in_vec[5:3]),
    .yi(in_vec[2:0]),
    .busy(out_vec[7:7]),
    .po(out_vec[6:6]),
    .xo(out_vec[5:3]),
    .yo(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc6;
    stim[1] = 8'hdc;
    stim[2] = 8'h4b;
    stim[3] = 8'h0d;
    stim[4] = 8'h77;
    stim[5] = 8'h6b;
    stim[6] = 8'h67;
    stim[7] = 8'h60;
    stim[8] = 8'h44;
    stim[9] = 8'h7d;
    stim[10] = 8'h07;
    stim[11] = 8'h1b;
    stim[12] = 8'h79;
    stim[13] = 8'h61;
    stim[14] = 8'h1c;
    stim[15] = 8'h14;
    stim[16] = 8'h4f;
    stim[17] = 8'h2a;
    stim[18] = 8'h13;
    stim[19] = 8'h7d;
    stim[20] = 8'h55;
    stim[21] = 8'h54;
    stim[22] = 8'h3d;
    stim[23] = 8'h12;
    stim[24] = 8'h12;
    stim[25] = 8'h72;
    stim[26] = 8'h0b;
    stim[27] = 8'h77;
    stim[28] = 8'h3e;
    stim[29] = 8'h32;
    stim[30] = 8'h5e;
    stim[31] = 8'h45;
    stim[32] = 8'h1c;
    stim[33] = 8'h00;
    stim[34] = 8'h33;
    stim[35] = 8'h12;
    stim[36] = 8'h4d;
    stim[37] = 8'h06;
    stim[38] = 8'h21;
    stim[39] = 8'h5b;
    stim[40] = 8'h2a;
    stim[41] = 8'h49;
    stim[42] = 8'h5b;
    stim[43] = 8'h4e;
    stim[44] = 8'h37;
    stim[45] = 8'h42;
    stim[46] = 8'h26;
    stim[47] = 8'h5a;
    stim[48] = 8'h04;
    stim[49] = 8'h00;
    stim[50] = 8'h08;
    stim[51] = 8'h26;
    stim[52] = 8'h2d;
    stim[53] = 8'h1c;
    stim[54] = 8'h74;
    stim[55] = 8'h78;
    stim[56] = 8'hd2;
    stim[57] = 8'h56;
    stim[58] = 8'h27;
    stim[59] = 8'h56;
    stim[60] = 8'h7b;
    stim[61] = 8'h0b;
    stim[62] = 8'h0d;
    stim[63] = 8'h3d;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h80;
      expv[4] = 8'h80;
      expv[5] = 8'h80;
      expv[6] = 8'h80;
      expv[7] = 8'hc8;
      expv[8] = 8'hd0;
      expv[9] = 8'hd8;
      expv[10] = 8'he0;
      expv[11] = 8'ha8;
      expv[12] = 8'hb0;
      expv[13] = 8'hb8;
      expv[14] = 8'h81;
      expv[15] = 8'hc9;
      expv[16] = 8'hd1;
      expv[17] = 8'hd9;
      expv[18] = 8'he1;
      expv[19] = 8'he9;
      expv[20] = 8'hb1;
      expv[21] = 8'hb9;
      expv[22] = 8'h82;
      expv[23] = 8'h8a;
      expv[24] = 8'hd2;
      expv[25] = 8'hda;
      expv[26] = 8'he2;
      expv[27] = 8'hea;
      expv[28] = 8'hf2;
      expv[29] = 8'hba;
      expv[30] = 8'h83;
      expv[31] = 8'h8b;
      expv[32] = 8'h93;
      expv[33] = 8'hdb;
      expv[34] = 8'he3;
      expv[35] = 8'heb;
      expv[36] = 8'hf3;
      expv[37] = 8'hfb;
      expv[38] = 8'h84;
      expv[39] = 8'h8c;
      expv[40] = 8'h94;
      expv[41] = 8'h9c;
      expv[42] = 8'he4;
      expv[43] = 8'hec;
      expv[44] = 8'hf4;
      expv[45] = 8'hfc;
      expv[46] = 8'hc5;
      expv[47] = 8'h8d;
      expv[48] = 8'h95;
      expv[49] = 8'h9d;
      expv[50] = 8'ha5;
      expv[51] = 8'hed;
      expv[52] = 8'hf5;
      expv[53] = 8'hfd;
      expv[54] = 8'hc6;
      expv[55] = 8'h8e;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h80;
      expv[59] = 8'h80;
      expv[60] = 8'h80;
      expv[61] = 8'hc0;
      expv[62] = 8'hc8;
      expv[63] = 8'h90;
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
