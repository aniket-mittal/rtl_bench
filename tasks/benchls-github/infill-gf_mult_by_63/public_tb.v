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

  gf_mult_by_63 dut (
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
    stim[0] = 8'h30;
    stim[1] = 8'ha1;
    stim[2] = 8'h1e;
    stim[3] = 8'he6;
    stim[4] = 8'he4;
    stim[5] = 8'hf5;
    stim[6] = 8'h71;
    stim[7] = 8'he6;
    stim[8] = 8'h9c;
    stim[9] = 8'h3f;
    stim[10] = 8'h81;
    stim[11] = 8'he7;
    stim[12] = 8'h6a;
    stim[13] = 8'hb3;
    stim[14] = 8'h66;
    stim[15] = 8'h5f;
    stim[16] = 8'h9a;
    stim[17] = 8'h85;
    stim[18] = 8'h3d;
    stim[19] = 8'h90;
    stim[20] = 8'h8b;
    stim[21] = 8'h89;
    stim[22] = 8'h24;
    stim[23] = 8'h1c;
    stim[24] = 8'h93;
    stim[25] = 8'h78;
    stim[26] = 8'hea;
    stim[27] = 8'hc7;
    stim[28] = 8'h21;
    stim[29] = 8'h7c;
    stim[30] = 8'he0;
    stim[31] = 8'h6f;
    stim[32] = 8'he4;
    stim[33] = 8'h73;
    stim[34] = 8'h69;
    stim[35] = 8'h3b;
    stim[36] = 8'hea;
    stim[37] = 8'hc8;
    stim[38] = 8'h00;
    stim[39] = 8'h60;
    stim[40] = 8'h8e;
    stim[41] = 8'h57;
    stim[42] = 8'h52;
    stim[43] = 8'h0b;
    stim[44] = 8'h49;
    stim[45] = 8'hdf;
    stim[46] = 8'h36;
    stim[47] = 8'hf2;
    stim[48] = 8'h45;
    stim[49] = 8'hd1;
    stim[50] = 8'h51;
    stim[51] = 8'haf;
    stim[52] = 8'h44;
    stim[53] = 8'hff;
    stim[54] = 8'h60;
    stim[55] = 8'hdd;
    stim[56] = 8'ha9;
    stim[57] = 8'h78;
    stim[58] = 8'hd6;
    stim[59] = 8'h97;
    stim[60] = 8'hdd;
    stim[61] = 8'h6c;
    stim[62] = 8'h31;
    stim[63] = 8'h85;
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
      expv[0] = 8'h82;
      expv[1] = 8'h48;
      expv[2] = 8'h16;
      expv[3] = 8'h99;
      expv[4] = 8'h5f;
      expv[5] = 8'h42;
      expv[6] = 8'h04;
      expv[7] = 8'h99;
      expv[8] = 8'h07;
      expv[9] = 8'h89;
      expv[10] = 8'hb4;
      expv[11] = 8'hfa;
      expv[12] = 8'he0;
      expv[13] = 8'hf0;
      expv[14] = 8'h4e;
      expv[15] = 8'h90;
      expv[16] = 8'h50;
      expv[17] = 8'h25;
      expv[18] = 8'h4f;
      expv[19] = 8'ha9;
      expv[20] = 8'h4d;
      expv[21] = 8'h8b;
      expv[22] = 8'h6d;
      expv[23] = 8'hd0;
      expv[24] = 8'h0c;
      expv[25] = 8'h58;
      expv[26] = 8'h37;
      expv[27] = 8'h06;
      expv[28] = 8'h9f;
      expv[29] = 8'hc9;
      expv[30] = 8'hce;
      expv[31] = 8'h12;
      expv[32] = 8'h5f;
      expv[33] = 8'hc2;
      expv[34] = 8'h45;
      expv[35] = 8'h18;
      expv[36] = 8'h37;
      expv[37] = 8'h0d;
      expv[38] = 8'h00;
      expv[39] = 8'h19;
      expv[40] = 8'hbf;
      expv[41] = 8'haf;
      expv[42] = 8'h5d;
      expv[43] = 8'h9a;
      expv[44] = 8'hb9;
      expv[45] = 8'h47;
      expv[46] = 8'hd5;
      expv[47] = 8'h76;
      expv[48] = 8'h17;
      expv[49] = 8'h2f;
      expv[50] = 8'hf8;
      expv[51] = 8'h20;
      expv[52] = 8'h74;
      expv[53] = 8'hbb;
      expv[54] = 8'h19;
      expv[55] = 8'h81;
      expv[56] = 8'h77;
      expv[57] = 8'h58;
      expv[58] = 8'h1b;
      expv[59] = 8'h9d;
      expv[60] = 8'h81;
      expv[61] = 8'hb7;
      expv[62] = 8'he1;
      expv[63] = 8'h25;
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
