// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08747 dut (
    .clk(clk),
    .addr0(in_vec[69:66]),
    .ce0(in_vec[65:65]),
    .d0(in_vec[64:1]),
    .we0(in_vec[0:0]),
    .q0(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h24588df8708f036cc0;
    stim[1] = 70'h24128e1dff1fa7bc66;
    stim[2] = 70'h035f941ae0ac4f32f0;
    stim[3] = 70'h18904876effdf82d22;
    stim[4] = 70'h155db3a7e0e8cfd664;
    stim[5] = 70'h027d760755a0a4b22f;
    stim[6] = 70'h2efaf545ec1f4acba6;
    stim[7] = 70'h0639b9e0bce66a10c5;
    stim[8] = 70'h06ec56bf1af54fe1e1;
    stim[9] = 70'h3c8cbc3d661430d3b2;
    stim[10] = 70'h304fea79314066fd12;
    stim[11] = 70'h2d7f018d2c4ac5b1d1;
    stim[12] = 70'h2fd6f6588b3a80dc10;
    stim[13] = 70'h2400d815977828242e;
    stim[14] = 70'h0c434aa44e89c50d53;
    stim[15] = 70'h31823e3acd8a85028d;
    stim[16] = 70'h39ba0dc68f1bf2ed9f;
    stim[17] = 70'h1474823520df367778;
    stim[18] = 70'h00ac89dd3ddca06b0b;
    stim[19] = 70'h1186bc504bfe55a181;
    stim[20] = 70'h09808b449cd28981f6;
    stim[21] = 70'h125ba4dc6b104429ac;
    stim[22] = 70'h1809e990274a164131;
    stim[23] = 70'h1079e78de24e1ef09d;
    stim[24] = 70'h2efaffcdeac8d7c86e;
    stim[25] = 70'h3964b803db4b5e7dfe;
    stim[26] = 70'h05fc83ad607034621d;
    stim[27] = 70'h1ede8575b57ab0d287;
    stim[28] = 70'h0cfef8076393dda154;
    stim[29] = 70'h2402f878c5fb4b36d8;
    stim[30] = 70'h1bf42010e424c374dc;
    stim[31] = 70'h1cff5a3afc5cded7c3;
    stim[32] = 70'h08b91f844235d75cd3;
    stim[33] = 70'h052e3a0f0f1c46a712;
    stim[34] = 70'h2a79ae43d5d1937e0c;
    stim[35] = 70'h057123c73257d008d6;
    stim[36] = 70'h0b443afc14b52ffc68;
    stim[37] = 70'h36fbdf03e60423d101;
    stim[38] = 70'h10dc20035f10f9c2a0;
    stim[39] = 70'h33474ff84d37f42251;
    stim[40] = 70'h37030f1ac7935e94b9;
    stim[41] = 70'h0be8d89a6ef8a60937;
    stim[42] = 70'h1facb49567b172948f;
    stim[43] = 70'h09845d969d64287d99;
    stim[44] = 70'h0c57346289ea4ccdf6;
    stim[45] = 70'h2a78e2fd29f6ecc866;
    stim[46] = 70'h2462ad59a826c695ad;
    stim[47] = 70'h1d02f529da4abcc34b;
    stim[48] = 70'h1973f5ada50529e759;
    stim[49] = 70'h14555a96a3173512a2;
    stim[50] = 70'h3f6f3cb9990833a3d3;
    stim[51] = 70'h04930469c900cf9910;
    stim[52] = 70'h0b0e0252227963dbc3;
    stim[53] = 70'h14eafb8d29c9979fa0;
    stim[54] = 70'h359a3cb59289b9d26a;
    stim[55] = 70'h3e8a1f1d1aee6b990b;
    stim[56] = 70'h0a87b8c7733285f025;
    stim[57] = 70'h03085333ff67f4be09;
    stim[58] = 70'h0652ba7d5d01c7e0af;
    stim[59] = 70'h121942041d67b3d88d;
    stim[60] = 70'h2520cce41fde2697b5;
    stim[61] = 70'h355a2871fc60d6c3fc;
    stim[62] = 70'h05f1c60126545347f0;
    stim[63] = 70'h2f359313d11ddd2de8;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'h3ebb03aad0525917;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'h1cdcf05e73350862;
      expv[9] = 64'h762b5f8d7aa7f0f0;
      expv[10] = 64'h762b5f8d7aa7f0f0;
      expv[11] = 64'h762b5f8d7aa7f0f0;
      expv[12] = 64'h762b5f8d7aa7f0f0;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'h6f42badabd586943;
      expv[29] = 64'h6f42badabd586943;
      expv[30] = 64'h6f42badabd586943;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'h7def81f30211e880;
      expv[39] = 64'h7def81f30211e880;
      expv[40] = 64'ha3a7fc269bfa1128;
      expv[41] = 64'h81878d63c9af4a5c;
      expv[42] = 64'hf46c4d377c53049b;
      expv[43] = 64'hd65a4ab3d8b94a47;
      expv[44] = 64'hd65a4ab3d8b94a47;
      expv[45] = 64'hd65a4ab3d8b94a47;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hb79e5ccc8419d1e9;
      expv[52] = 64'hb79e5ccc8419d1e9;
      expv[53] = 64'h870129113cb1ede1;
      expv[54] = 64'h870129113cb1ede1;
      expv[55] = 64'h870129113cb1ede1;
      expv[56] = 64'h450f8e8d7735cc85;
      expv[57] = 64'h43dc63b99942f812;
      expv[58] = 64'h842999ffb3fa5f04;
      expv[59] = 64'h295d3eae80e3f057;
      expv[60] = 64'h0ca1020eb3d9ec46;
      expv[61] = 64'h0ca1020eb3d9ec46;
      expv[62] = 64'h0ca1020eb3d9ec46;
      expv[63] = 64'h0ca1020eb3d9ec46;
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
