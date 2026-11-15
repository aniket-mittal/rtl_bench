// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_060083 dut (
    .Bus2IP_Clk(clk),
    .reset_fill_fifo(in_vec[68:68]),
    .start_fill_fifo(in_vec[67:67]),
    .hsync(in_vec[66:66]),
    .vsync(in_vec[65:65]),
    .half_full(in_vec[64:64]),
    .FRAME_BASE_ADDR(in_vec[63:32]),
    .LINE_STRIDE(in_vec[31:0]),
    .ddr_addr_to_read(out_vec[32:1]),
    .go_fill_fifo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h14dccec5a38f702648;
    stim[1] = 69'h10eab6bef0d0137e6a;
    stim[2] = 69'h0a7aca2ef612f9df5e;
    stim[3] = 69'h06753ac6fe2c6d1ddd;
    stim[4] = 69'h0d378aed9171b31c3d;
    stim[5] = 69'h0bc84ec188b0a74258;
    stim[6] = 69'h07ddfc0f35da1137a3;
    stim[7] = 69'h084937b32f143123df;
    stim[8] = 69'h03fadbc234418d74b9;
    stim[9] = 69'h0c06d8402bdbca0cdd;
    stim[10] = 69'h082f1b23739b9a9868;
    stim[11] = 69'h035fbe0c2450599668;
    stim[12] = 69'h01625c1c95547c7b31;
    stim[13] = 69'h0f0181119c713d0984;
    stim[14] = 69'h1b83f11bbd4ba0002b;
    stim[15] = 69'h079ddbe6d75d23a2d8;
    stim[16] = 69'h010e127803e6ee9f84;
    stim[17] = 69'h0d508b973cad50fd45;
    stim[18] = 69'h195cd952dbdd1db5e3;
    stim[19] = 69'h0d605b679d8b1bdffd;
    stim[20] = 69'h0e85914c07505e455d;
    stim[21] = 69'h07673f5ea52113975a;
    stim[22] = 69'h0ff0a480737af94c87;
    stim[23] = 69'h0873be2fa35cd9fe5c;
    stim[24] = 69'h09417b72e7fa21a980;
    stim[25] = 69'h0b0a0d217e713f961a;
    stim[26] = 69'h05798fd9d8fd169e1f;
    stim[27] = 69'h000ec5385ce92babf8;
    stim[28] = 69'h0a3d7fbb10434be4b8;
    stim[29] = 69'h0d9af2150c70805e1f;
    stim[30] = 69'h023d12d2f093baa25b;
    stim[31] = 69'h02a877493c2b1c2dbf;
    stim[32] = 69'h0136c0fe9c48846ba7;
    stim[33] = 69'h0b62071fb8604779c9;
    stim[34] = 69'h0ba04edfa8832b1616;
    stim[35] = 69'h04219c935b6b5a8be5;
    stim[36] = 69'h09e39e8d8b15109e02;
    stim[37] = 69'h0abb4116e4895ba9db;
    stim[38] = 69'h05e5752ab0c0cd57dd;
    stim[39] = 69'h18a73117077418721f;
    stim[40] = 69'h0ba089b0ff95a49d4c;
    stim[41] = 69'h09f69a8a82d575c3d1;
    stim[42] = 69'h09a0b084d913040522;
    stim[43] = 69'h0dbff811789e59d4e2;
    stim[44] = 69'h05cca42040087f5eec;
    stim[45] = 69'h05cf0cefaa274d4e11;
    stim[46] = 69'h058f7da2a5697f309e;
    stim[47] = 69'h0c182a055490991382;
    stim[48] = 69'h0bbc3fe2d2484ddf22;
    stim[49] = 69'h0101e94748a7712911;
    stim[50] = 69'h0cc1bafea63cad35cc;
    stim[51] = 69'h02ff83e259f77d5934;
    stim[52] = 69'h0933b0b33c0de38f1a;
    stim[53] = 69'h08a0a0630d21c1f385;
    stim[54] = 69'h032d4e107e249bd91f;
    stim[55] = 69'h00c0bc9f843f3e247e;
    stim[56] = 69'h0a99e456c227c38b6a;
    stim[57] = 69'h063d65fd6c3801b02e;
    stim[58] = 69'h05236bfb2fc988a1c2;
    stim[59] = 69'h04d8cf8cfe0a8f003d;
    stim[60] = 69'h06ab7d3b8d31e1e011;
    stim[61] = 69'h035808f462cf62815b;
    stim[62] = 69'h003bb057e803a054ec;
    stim[63] = 69'h040f3e77a536def463;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h06f15db23;
      expv[6] = 33'h06f15db22;
      expv[7] = 33'h13f9f983b;
      expv[8] = 33'h13f9f983a;
      expv[9] = 33'h000000000;
      expv[10] = 33'h00db08057;
      expv[11] = 33'h00db08056;
      expv[12] = 33'h0907d3397;
      expv[13] = 33'h0907d3396;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h01c24f007;
      expv[18] = 33'h01c24f006;
      expv[19] = 33'h01c24f007;
      expv[20] = 33'h000000000;
      expv[21] = 33'h10b22980f;
      expv[22] = 33'h10b22980e;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h082f6e5cf;
      expv[26] = 33'h082f6e5ce;
      expv[27] = 33'h082f6e7cf;
      expv[28] = 33'h082f6e7ce;
      expv[29] = 33'h09d560d8f;
      expv[30] = 33'h09d560d8e;
      expv[31] = 33'h000000000;
      expv[32] = 33'h150ee9279;
      expv[33] = 33'h150ee9278;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h0433926b7;
      expv[37] = 33'h0433926b6;
      expv[38] = 33'h08e16758f;
      expv[39] = 33'h08e16758e;
      expv[40] = 33'h08e16758e;
      expv[41] = 33'h000000000;
      expv[42] = 33'h1ed351505;
      expv[43] = 33'h1ed351504;
      expv[44] = 33'h1ed351705;
      expv[45] = 33'h1ed351704;
      expv[46] = 33'h1279f878d;
      expv[47] = 33'h1279f878c;
      expv[48] = 33'h1ac68239d;
      expv[49] = 33'h1ac68239c;
      expv[50] = 33'h0e7f16c25;
      expv[51] = 33'h0e7f16c24;
      expv[52] = 33'h0e7f16e25;
      expv[53] = 33'h0e7f16e24;
      expv[54] = 33'h000000000;
      expv[55] = 33'h05a9c20fd;
      expv[56] = 33'h05a9c20fc;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h046d7f65f;
      expv[60] = 33'h046d7f65e;
      expv[61] = 33'h1d5e6f6e7;
      expv[62] = 33'h1d5e6f6e6;
      expv[63] = 33'h000000000;
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
