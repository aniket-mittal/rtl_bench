// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202362 dut (
    .clk(clk),
    .opA(in_vec[66:35]),
    .opB(in_vec[34:3]),
    .sel(in_vec[2:0]),
    .res(out_vec[34:3]),
    .z(out_vec[2:2]),
    .c(out_vec[1:1]),
    .v(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4fa6713c4c98c0677;
    stim[1] = 67'h64ab1fae69754adf7;
    stim[2] = 67'h044d5ec5d5b051175;
    stim[3] = 67'h0ab172b24d4f7019a;
    stim[4] = 67'h7a10da6b6763ac136;
    stim[5] = 67'h2446e34002b40942e;
    stim[6] = 67'h37fbb0c56b85a8b54;
    stim[7] = 67'h05b4aed0b9235aec2;
    stim[8] = 67'h2bdfdbf0868b1d3c6;
    stim[9] = 67'h13d5669e1bed62f73;
    stim[10] = 67'h3fc89ab429bd0b6f1;
    stim[11] = 67'h27f86ec74ea57a188;
    stim[12] = 67'h0e01f3770106d04ea;
    stim[13] = 67'h47d2ecfc7f6255f89;
    stim[14] = 67'h15ef3c27e8def09ea;
    stim[15] = 67'h524b79aba30c2d015;
    stim[16] = 67'h07bb6fd2235d384cc;
    stim[17] = 67'h4af3eafb0cd3914cb;
    stim[18] = 67'h0038da88a90a9933e;
    stim[19] = 67'h5a591f260327c2b7b;
    stim[20] = 67'h6edc2b991ca70bac5;
    stim[21] = 67'h4be5dd6c40ff04e14;
    stim[22] = 67'h7a78ff00c3c3ad73a;
    stim[23] = 67'h336332f5d66a8b686;
    stim[24] = 67'h202534d7c3d364adf;
    stim[25] = 67'h76752f0367657ad0d;
    stim[26] = 67'h09de7362897453471;
    stim[27] = 67'h00a2b70ab76a61cf1;
    stim[28] = 67'h0c8775c6e0847be5f;
    stim[29] = 67'h03244c55088ae5309;
    stim[30] = 67'h38c97235d33616558;
    stim[31] = 67'h4eed75cb5c6e49ef7;
    stim[32] = 67'h3ee656f1d50880885;
    stim[33] = 67'h5c98213b0f7ae4080;
    stim[34] = 67'h1ee50245820b28a94;
    stim[35] = 67'h616ea32125b9f2118;
    stim[36] = 67'h27f2cbf860a0fdb98;
    stim[37] = 67'h654f1aee63de52baf;
    stim[38] = 67'h2b544453916a3759a;
    stim[39] = 67'h476a9a666d69ff11f;
    stim[40] = 67'h65e95cae73c14e369;
    stim[41] = 67'h4a77ba9796f99dad0;
    stim[42] = 67'h33bad7031750dc481;
    stim[43] = 67'h4fc3b0102f568abca;
    stim[44] = 67'h3c0d8c7d957cb8108;
    stim[45] = 67'h6ae8b65ef6ed01348;
    stim[46] = 67'h1633bebdbd157849e;
    stim[47] = 67'h13ed6f4aeb845528a;
    stim[48] = 67'h6aea3522c7fdaed26;
    stim[49] = 67'h710795fc64581ec9f;
    stim[50] = 67'h6bec425cfd7142df1;
    stim[51] = 67'h433491a8d2e4b2380;
    stim[52] = 67'h5c473946f6d16fea9;
    stim[53] = 67'h4b7f9968af6f0c401;
    stim[54] = 67'h5b01dcda3836a3cca;
    stim[55] = 67'h14084b44f509f8a25;
    stim[56] = 67'h590f4b17ff06155ec;
    stim[57] = 67'h1eea205adb46d2eea;
    stim[58] = 67'h066be12bedeb1c096;
    stim[59] = 67'h1395075de42d14d0b;
    stim[60] = 67'h4f1639872f102229c;
    stim[61] = 67'h3d76a98fbad911b2f;
    stim[62] = 67'h63bb7f7d1058d7595;
    stim[63] = 67'h418e22eb5d50f8aec;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h080170104;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h48044f3ac;
      expv[8] = 35'h01200ac00;
      expv[9] = 35'h000000000;
      expv[10] = 35'h1bfd66ff4;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h0000d0464;
      expv[14] = 35'h000000000;
      expv[15] = 35'h00ce3006c;
      expv[16] = 35'h000000000;
      expv[17] = 35'h7844902dc;
      expv[18] = 35'h4ef3fbff8;
      expv[19] = 35'h000000000;
      expv[20] = 35'h5b7fdfb7c;
      expv[21] = 35'h000000000;
      expv[22] = 35'h341a2293c;
      expv[23] = 35'h4240ad008;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000000;
      expv[26] = 35'h000000000;
      expv[27] = 35'h000000000;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h611afdba4;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h000000000;
      expv[39] = 35'h01400451c;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h000000000;
      expv[44] = 35'h0f4280104;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h03844508c;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h000000000;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h180080c84;
      expv[56] = 35'h000000000;
      expv[57] = 35'h26f0b4e84;
      expv[58] = 35'h1a42004a8;
      expv[59] = 35'h000000000;
      expv[60] = 35'h77bd17ddc;
      expv[61] = 35'h30e9c6788;
      expv[62] = 35'h000000000;
      expv[63] = 35'h000000000;
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
