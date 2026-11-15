// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06107 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[47:16]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hcc829;
    stim[1] = 20'h4b82b;
    stim[2] = 20'hc6698;
    stim[3] = 20'h93126;
    stim[4] = 20'h4c672;
    stim[5] = 20'h2f69e;
    stim[6] = 20'he4a90;
    stim[7] = 20'hc5e92;
    stim[8] = 20'hd2aca;
    stim[9] = 20'h5f888;
    stim[10] = 20'hb60de;
    stim[11] = 20'h26146;
    stim[12] = 20'h17a0e;
    stim[13] = 20'h6d842;
    stim[14] = 20'hf9ab0;
    stim[15] = 20'hdf6b8;
    stim[16] = 20'h8751e;
    stim[17] = 20'hed50f;
    stim[18] = 20'h69a2a;
    stim[19] = 20'hf851a;
    stim[20] = 20'h4856c;
    stim[21] = 20'h6c82a;
    stim[22] = 20'hdcb76;
    stim[23] = 20'hf2242;
    stim[24] = 20'h69bc2;
    stim[25] = 20'h4dd48;
    stim[26] = 20'h45e64;
    stim[27] = 20'hd63f0;
    stim[28] = 20'h3b1e4;
    stim[29] = 20'h9934c;
    stim[30] = 20'h80f44;
    stim[31] = 20'hc584e;
    stim[32] = 20'hbdec0;
    stim[33] = 20'hb64f4;
    stim[34] = 20'h3acf0;
    stim[35] = 20'hd5dc4;
    stim[36] = 20'h2265a;
    stim[37] = 20'h97700;
    stim[38] = 20'h57526;
    stim[39] = 20'h05386;
    stim[40] = 20'headc2;
    stim[41] = 20'hba862;
    stim[42] = 20'hccff2;
    stim[43] = 20'h59034;
    stim[44] = 20'he2fe0;
    stim[45] = 20'h6b6f6;
    stim[46] = 20'hb858a;
    stim[47] = 20'ha9b1a;
    stim[48] = 20'h3a382;
    stim[49] = 20'h62da0;
    stim[50] = 20'h9c568;
    stim[51] = 20'h01522;
    stim[52] = 20'hd5c94;
    stim[53] = 20'h88824;
    stim[54] = 20'h470a2;
    stim[55] = 20'hcd0fe;
    stim[56] = 20'hdc854;
    stim[57] = 20'heef34;
    stim[58] = 20'hf3b8e;
    stim[59] = 20'h36d06;
    stim[60] = 20'he9090;
    stim[61] = 20'h3a32e;
    stim[62] = 20'h22e7e;
    stim[63] = 20'h4f608;
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
      expv[0] = 48'hffffffffffff;
      expv[1] = 48'hffffffffffff;
      expv[2] = 48'hffffffffffff;
      expv[3] = 48'hffffffffffff;
      expv[4] = 48'hffffffffffff;
      expv[5] = 48'hffffffff0000;
      expv[6] = 48'hffffffffffff;
      expv[7] = 48'hffffffffffff;
      expv[8] = 48'hffffffff0000;
      expv[9] = 48'hb8b5922b52e2;
      expv[10] = 48'hb8b5922b52e2;
      expv[11] = 48'hffffffffffff;
      expv[12] = 48'hffffffffffff;
      expv[13] = 48'hffffffffffff;
      expv[14] = 48'hffffffff0000;
      expv[15] = 48'hffffffff0000;
      expv[16] = 48'hffffffff0000;
      expv[17] = 48'hffffffffffff;
      expv[18] = 48'hffffffffffff;
      expv[19] = 48'he9579e681568;
      expv[20] = 48'h9fe89876e806;
      expv[21] = 48'hffffffffffff;
      expv[22] = 48'h5d5ce9cfc545;
      expv[23] = 48'hffffffffffff;
      expv[24] = 48'hffffffff0000;
      expv[25] = 48'hffffffff0000;
      expv[26] = 48'hffffffff0000;
      expv[27] = 48'hffffffffffff;
      expv[28] = 48'hffffffffffff;
      expv[29] = 48'hffffffffffff;
      expv[30] = 48'hffffffffffff;
      expv[31] = 48'hffffffffffff;
      expv[32] = 48'hffffffffffff;
      expv[33] = 48'hffffffffffff;
      expv[34] = 48'hffffffffffff;
      expv[35] = 48'hffffffffffff;
      expv[36] = 48'hffffffffffff;
      expv[37] = 48'h60cc33ceccf9;
      expv[38] = 48'h60cc33ceccf9;
      expv[39] = 48'hffffffffffff;
      expv[40] = 48'hffffffffffff;
      expv[41] = 48'hffffffff0000;
      expv[42] = 48'hffffffff0000;
      expv[43] = 48'hffffffff0000;
      expv[44] = 48'hffffffffffff;
      expv[45] = 48'hffffffffffff;
      expv[46] = 48'hffffffffffff;
      expv[47] = 48'h47807f90fe1d;
      expv[48] = 48'hcd34d992d34c;
      expv[49] = 48'hd992ffffb664;
      expv[50] = 48'hd992ffffb664;
      expv[51] = 48'hd992ffffb664;
      expv[52] = 48'hffffffff0000;
      expv[53] = 48'hffffffffffff;
      expv[54] = 48'hffffffffffff;
      expv[55] = 48'hffffffff0000;
      expv[56] = 48'hffffffffffff;
      expv[57] = 48'hffffffffffff;
      expv[58] = 48'hffffffffffff;
      expv[59] = 48'hffffffffffff;
      expv[60] = 48'hffffffffffff;
      expv[61] = 48'hffffffffffff;
      expv[62] = 48'hffffffffffff;
      expv[63] = 48'hffffffffffff;
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
