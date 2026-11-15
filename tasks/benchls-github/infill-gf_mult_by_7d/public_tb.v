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

  gf_mult_by_7d dut (
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
    stim[0] = 8'h66;
    stim[1] = 8'hd2;
    stim[2] = 8'h3b;
    stim[3] = 8'h08;
    stim[4] = 8'ha7;
    stim[5] = 8'h00;
    stim[6] = 8'he7;
    stim[7] = 8'hdc;
    stim[8] = 8'h5f;
    stim[9] = 8'h2a;
    stim[10] = 8'hd0;
    stim[11] = 8'h48;
    stim[12] = 8'hd3;
    stim[13] = 8'hb9;
    stim[14] = 8'h3e;
    stim[15] = 8'h2f;
    stim[16] = 8'hb8;
    stim[17] = 8'h2f;
    stim[18] = 8'hb7;
    stim[19] = 8'h26;
    stim[20] = 8'h68;
    stim[21] = 8'hc7;
    stim[22] = 8'hdf;
    stim[23] = 8'h59;
    stim[24] = 8'ha3;
    stim[25] = 8'haf;
    stim[26] = 8'h52;
    stim[27] = 8'h0c;
    stim[28] = 8'hfc;
    stim[29] = 8'hb5;
    stim[30] = 8'h80;
    stim[31] = 8'h90;
    stim[32] = 8'h76;
    stim[33] = 8'h53;
    stim[34] = 8'h54;
    stim[35] = 8'hd1;
    stim[36] = 8'h76;
    stim[37] = 8'hf3;
    stim[38] = 8'h9b;
    stim[39] = 8'h14;
    stim[40] = 8'h0a;
    stim[41] = 8'hd8;
    stim[42] = 8'hc6;
    stim[43] = 8'h14;
    stim[44] = 8'hda;
    stim[45] = 8'h81;
    stim[46] = 8'ha2;
    stim[47] = 8'h23;
    stim[48] = 8'h37;
    stim[49] = 8'had;
    stim[50] = 8'h0f;
    stim[51] = 8'hf6;
    stim[52] = 8'h2c;
    stim[53] = 8'hf8;
    stim[54] = 8'hf2;
    stim[55] = 8'hca;
    stim[56] = 8'h2d;
    stim[57] = 8'h3e;
    stim[58] = 8'hc4;
    stim[59] = 8'ha7;
    stim[60] = 8'h02;
    stim[61] = 8'hc2;
    stim[62] = 8'hb0;
    stim[63] = 8'h6a;
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
      expv[0] = 8'h3e;
      expv[1] = 8'h23;
      expv[2] = 8'hd0;
      expv[3] = 8'hcf;
      expv[4] = 8'h19;
      expv[5] = 8'h00;
      expv[6] = 8'h2f;
      expv[7] = 8'hff;
      expv[8] = 8'h14;
      expv[9] = 8'h2e;
      expv[10] = 8'hd9;
      expv[11] = 8'hf9;
      expv[12] = 8'h5e;
      expv[13] = 8'h46;
      expv[14] = 8'h44;
      expv[15] = 8'hba;
      expv[16] = 8'h3b;
      expv[17] = 8'hba;
      expv[18] = 8'h9a;
      expv[19] = 8'h08;
      expv[20] = 8'he2;
      expv[21] = 8'h34;
      expv[22] = 8'h78;
      expv[23] = 8'h07;
      expv[24] = 8'hf0;
      expv[25] = 8'hd6;
      expv[26] = 8'h4f;
      expv[27] = 8'h26;
      expv[28] = 8'he4;
      expv[29] = 8'h60;
      expv[30] = 8'h6c;
      expv[31] = 8'hef;
      expv[32] = 8'hbd;
      expv[33] = 8'h32;
      expv[34] = 8'h5c;
      expv[35] = 8'ha4;
      expv[36] = 8'hbd;
      expv[37] = 8'h45;
      expv[38] = 8'ha7;
      expv[39] = 8'h6a;
      expv[40] = 8'h35;
      expv[41] = 8'h16;
      expv[42] = 8'h49;
      expv[43] = 8'h6a;
      expv[44] = 8'hec;
      expv[45] = 8'h11;
      expv[46] = 8'h8d;
      expv[47] = 8'h9c;
      expv[48] = 8'hf6;
      expv[49] = 8'h2c;
      expv[50] = 8'ha1;
      expv[51] = 8'hd1;
      expv[52] = 8'h3d;
      expv[53] = 8'h0d;
      expv[54] = 8'h38;
      expv[55] = 8'h6f;
      expv[56] = 8'h40;
      expv[57] = 8'h44;
      expv[58] = 8'hb3;
      expv[59] = 8'h19;
      expv[60] = 8'hfa;
      expv[61] = 8'ha0;
      expv[62] = 8'hf4;
      expv[63] = 8'h18;
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
