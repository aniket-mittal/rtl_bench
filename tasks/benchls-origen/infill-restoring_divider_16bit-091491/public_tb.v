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

  origen_091491 dut (
    .x(in_vec[31:16]),
    .y(in_vec[15:0]),
    .quotient(out_vec[31:16]),
    .remainder(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h47ea0ac2;
    stim[1] = 32'h364cbda5;
    stim[2] = 32'h2bf664d2;
    stim[3] = 32'h76e11406;
    stim[4] = 32'h11053cac;
    stim[5] = 32'he718d016;
    stim[6] = 32'had2cb350;
    stim[7] = 32'h7684e5d8;
    stim[8] = 32'h3c35096c;
    stim[9] = 32'h67017fbb;
    stim[10] = 32'h3dced82f;
    stim[11] = 32'he5d0e6aa;
    stim[12] = 32'hbd83b84f;
    stim[13] = 32'h25d04fd6;
    stim[14] = 32'hec35c28d;
    stim[15] = 32'h94d0d9ff;
    stim[16] = 32'h26d65d0a;
    stim[17] = 32'h8ce55f0a;
    stim[18] = 32'h2a47184b;
    stim[19] = 32'h396ea6c8;
    stim[20] = 32'ha377c6a2;
    stim[21] = 32'h6262d380;
    stim[22] = 32'h026ad29e;
    stim[23] = 32'ha5a18604;
    stim[24] = 32'hba711656;
    stim[25] = 32'hdc3bbc07;
    stim[26] = 32'h8d4c4bbd;
    stim[27] = 32'h4016fcc7;
    stim[28] = 32'h172dddb3;
    stim[29] = 32'hef4336e6;
    stim[30] = 32'habdf8836;
    stim[31] = 32'h5e5fbc34;
    stim[32] = 32'hdf6e485e;
    stim[33] = 32'hce26a4e2;
    stim[34] = 32'h4f3f1841;
    stim[35] = 32'h361a6c77;
    stim[36] = 32'h8f33b76b;
    stim[37] = 32'ha92abcaa;
    stim[38] = 32'h90c2c54b;
    stim[39] = 32'h7e6e59ed;
    stim[40] = 32'h957928f8;
    stim[41] = 32'h4634a557;
    stim[42] = 32'h6d1815d4;
    stim[43] = 32'h06b18dd1;
    stim[44] = 32'hf4946273;
    stim[45] = 32'h0930705a;
    stim[46] = 32'h6d9987d6;
    stim[47] = 32'h2dff6cbb;
    stim[48] = 32'hcd849bb2;
    stim[49] = 32'h138e92cb;
    stim[50] = 32'h6d66d5c8;
    stim[51] = 32'h0e04f1ea;
    stim[52] = 32'ha7034763;
    stim[53] = 32'h782729b9;
    stim[54] = 32'he681634d;
    stim[55] = 32'h207526af;
    stim[56] = 32'hf4a0d76d;
    stim[57] = 32'h3ef6f7e6;
    stim[58] = 32'hed3df7e2;
    stim[59] = 32'hc3586ad7;
    stim[60] = 32'hdc5653a1;
    stim[61] = 32'heb34b08d;
    stim[62] = 32'h9f78691a;
    stim[63] = 32'h3f8833ed;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h0006075e;
      expv[2] = 32'h0000364c;
      expv[3] = 32'h00002bf6;
      expv[4] = 32'h000512c3;
      expv[5] = 32'h00001105;
      expv[6] = 32'h00011702;
      expv[7] = 32'h0000ad2c;
      expv[8] = 32'h00007684;
      expv[9] = 32'h000603ad;
      expv[10] = 32'h00006701;
      expv[11] = 32'h00003dce;
      expv[12] = 32'h0000e5d0;
      expv[13] = 32'h00010534;
      expv[14] = 32'h000025d0;
      expv[15] = 32'h000129a8;
      expv[16] = 32'h000094d0;
      expv[17] = 32'h000026d6;
      expv[18] = 32'h00012ddb;
      expv[19] = 32'h000111fc;
      expv[20] = 32'h0000396e;
      expv[21] = 32'h0000a377;
      expv[22] = 32'h00006262;
      expv[23] = 32'h0000026a;
      expv[24] = 32'h00011f9d;
      expv[25] = 32'h000807c1;
      expv[26] = 32'h00012034;
      expv[27] = 32'h0001418f;
      expv[28] = 32'h00004016;
      expv[29] = 32'h0000172d;
      expv[30] = 32'h000413ab;
      expv[31] = 32'h000123a9;
      expv[32] = 32'h00005e5f;
      expv[33] = 32'h00030654;
      expv[34] = 32'h00012944;
      expv[35] = 32'h0003067c;
      expv[36] = 32'h0000361a;
      expv[37] = 32'h00008f33;
      expv[38] = 32'h0000a92a;
      expv[39] = 32'h000090c2;
      expv[40] = 32'h00012481;
      expv[41] = 32'h00031a91;
      expv[42] = 32'h00004634;
      expv[43] = 32'h000415c8;
      expv[44] = 32'h000006b1;
      expv[45] = 32'h00022fae;
      expv[46] = 32'h00000930;
      expv[47] = 32'h00006d99;
      expv[48] = 32'h00002dff;
      expv[49] = 32'h000131d2;
      expv[50] = 32'h0000138e;
      expv[51] = 32'h00006d66;
      expv[52] = 32'h00000e04;
      expv[53] = 32'h0002183d;
      expv[54] = 32'h000224b5;
      expv[55] = 32'h00021fe7;
      expv[56] = 32'h00002075;
      expv[57] = 32'h00011d33;
      expv[58] = 32'h00003ef6;
      expv[59] = 32'h0000ed3d;
      expv[60] = 32'h00015881;
      expv[61] = 32'h00023514;
      expv[62] = 32'h00013aa7;
      expv[63] = 32'h0001365e;
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
