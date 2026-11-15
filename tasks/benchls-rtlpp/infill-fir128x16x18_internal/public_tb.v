// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fir128x16x18_internal dut (
    .clk(clk),
    .cin(in_vec[35:20]),
    .din(in_vec[19:4]),
    .write(in_vec[3:3]),
    .load(in_vec[2:2]),
    .start(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .dout(out_vec[17:2]),
    .rdy(out_vec[1:1]),
    .ovf(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h96952d653;
    stim[1] = 36'hbead02e33;
    stim[2] = 36'h386b03177;
    stim[3] = 36'hcc56ace3a;
    stim[4] = 36'he5a879f30;
    stim[5] = 36'he24857b1e;
    stim[6] = 36'h2ede03c18;
    stim[7] = 36'h67e8ad08e;
    stim[8] = 36'h85e01874e;
    stim[9] = 36'h7d703d4e4;
    stim[10] = 36'hff153a69e;
    stim[11] = 36'h5df5b6e6e;
    stim[12] = 36'h1fe9b888a;
    stim[13] = 36'h5b4c4904c;
    stim[14] = 36'hca2a78c72;
    stim[15] = 36'hb77687258;
    stim[16] = 36'h8ad49b71c;
    stim[17] = 36'h9d70ea948;
    stim[18] = 36'h8480d2cb8;
    stim[19] = 36'h376594b6a;
    stim[20] = 36'h882fe8e52;
    stim[21] = 36'h2b256daec;
    stim[22] = 36'h040320bc4;
    stim[23] = 36'h0e64f1626;
    stim[24] = 36'hd8a671c92;
    stim[25] = 36'h98fbf8922;
    stim[26] = 36'h12cc5d6b6;
    stim[27] = 36'h4997dd732;
    stim[28] = 36'h5b21c8976;
    stim[29] = 36'h94cc2b21c;
    stim[30] = 36'hb81b7ed18;
    stim[31] = 36'h747a862f6;
    stim[32] = 36'h8179c0c22;
    stim[33] = 36'h3bb052b56;
    stim[34] = 36'h3e626a7f4;
    stim[35] = 36'h807c44118;
    stim[36] = 36'hf81da1892;
    stim[37] = 36'h6c7130b88;
    stim[38] = 36'hae7b0905a;
    stim[39] = 36'h453ae905e;
    stim[40] = 36'h4698d74aa;
    stim[41] = 36'h3adae54fe;
    stim[42] = 36'h7be73cb64;
    stim[43] = 36'h2f599d042;
    stim[44] = 36'hd78a86c8e;
    stim[45] = 36'h854ed7692;
    stim[46] = 36'h80132bb2a;
    stim[47] = 36'h635e4dc04;
    stim[48] = 36'h1a5e4aef4;
    stim[49] = 36'h39c78430a;
    stim[50] = 36'hbd3813448;
    stim[51] = 36'hbd4321486;
    stim[52] = 36'ha19b87508;
    stim[53] = 36'hd6daaa11a;
    stim[54] = 36'h0158e76ac;
    stim[55] = 36'hff00b4662;
    stim[56] = 36'h87e58287a;
    stim[57] = 36'h9823d2b32;
    stim[58] = 36'he18f57326;
    stim[59] = 36'had746c778;
    stim[60] = 36'h6484aedbe;
    stim[61] = 36'h169d78c04;
    stim[62] = 36'h3b954fbc6;
    stim[63] = 36'h4fa591da2;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h061d2;
      expv[16] = 18'h061d2;
      expv[17] = 18'h061d2;
      expv[18] = 18'h061d2;
      expv[19] = 18'h061d2;
      expv[20] = 18'h061d2;
      expv[21] = 18'h061d2;
      expv[22] = 18'h061d2;
      expv[23] = 18'h061d2;
      expv[24] = 18'h061d2;
      expv[25] = 18'h1b6ba;
      expv[26] = 18'h1b6ba;
      expv[27] = 18'h1b6ba;
      expv[28] = 18'h1b6ba;
      expv[29] = 18'h1b6ba;
      expv[30] = 18'h1b6ba;
      expv[31] = 18'h1b6ba;
      expv[32] = 18'h1b6ba;
      expv[33] = 18'h1fb46;
      expv[34] = 18'h1fb46;
      expv[35] = 18'h1fb46;
      expv[36] = 18'h1fb46;
      expv[37] = 18'h1fb46;
      expv[38] = 18'h1fb46;
      expv[39] = 18'h1fb46;
      expv[40] = 18'h1fb46;
      expv[41] = 18'h1fb46;
      expv[42] = 18'h1fb46;
      expv[43] = 18'h1fb46;
      expv[44] = 18'h3953e;
      expv[45] = 18'h3953e;
      expv[46] = 18'h3953e;
      expv[47] = 18'h3953e;
      expv[48] = 18'h3953e;
      expv[49] = 18'h3953e;
      expv[50] = 18'h3953e;
      expv[51] = 18'h3953e;
      expv[52] = 18'h3953e;
      expv[53] = 18'h3953e;
      expv[54] = 18'h3953e;
      expv[55] = 18'h3953e;
      expv[56] = 18'h04d12;
      expv[57] = 18'h04d12;
      expv[58] = 18'h04d12;
      expv[59] = 18'h04d12;
      expv[60] = 18'h04d12;
      expv[61] = 18'h04d12;
      expv[62] = 18'h04d12;
      expv[63] = 18'h04d12;
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
