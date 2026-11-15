// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 61;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07867 dut (
    .clock(clk),
    .idle_NormaliseSum(in_vec[60:60]),
    .sout_NormaliseSum(in_vec[59:28]),
    .sum_NormaliseSum(in_vec[27:0]),
    .sout_PackSum(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 61'h0d7421d86cd88336;
    stim[1] = 61'h1c51df42ae2b0cbb;
    stim[2] = 61'h0f49644822ae7fcc;
    stim[3] = 61'h095fea1b4e4e4fc4;
    stim[4] = 61'h1ee1f1ca358050a0;
    stim[5] = 61'h16e426338b1c657d;
    stim[6] = 61'h0fc819ac0c4ea28f;
    stim[7] = 61'h1194bfc4fe1b211c;
    stim[8] = 61'h113bd158ce2f97af;
    stim[9] = 61'h1c789bcf965b4b17;
    stim[10] = 61'h0027e99e4ce9b511;
    stim[11] = 61'h08744ad76f541b13;
    stim[12] = 61'h13e07f18c12b3fc4;
    stim[13] = 61'h0d585b522c5bd0c8;
    stim[14] = 61'h09b644eb67cfd1b2;
    stim[15] = 61'h0ebc9efc82a08ea8;
    stim[16] = 61'h02fa2ba70901a580;
    stim[17] = 61'h18eac69d7d3c5e3c;
    stim[18] = 61'h0f526348da63e864;
    stim[19] = 61'h0f4111b108aee113;
    stim[20] = 61'h0a14dd28b4defa0d;
    stim[21] = 61'h01ae54ce33c896e7;
    stim[22] = 61'h07a2d13341338eb1;
    stim[23] = 61'h0ddc3deb668e3c44;
    stim[24] = 61'h10122c6e0deadf0c;
    stim[25] = 61'h1ed8a5867f5dcd3e;
    stim[26] = 61'h014568be0278fbc6;
    stim[27] = 61'h108c34ee6d6ad87e;
    stim[28] = 61'h18c95eadcd0724cc;
    stim[29] = 61'h1d1db1aa8d703247;
    stim[30] = 61'h04887fed60087395;
    stim[31] = 61'h05fa63bb0f48c1c1;
    stim[32] = 61'h1fe7ea87bf993d47;
    stim[33] = 61'h1c885d8949be2325;
    stim[34] = 61'h1fc9ee5be6db81a0;
    stim[35] = 61'h0c821e09a7629ed5;
    stim[36] = 61'h049e248568393031;
    stim[37] = 61'h06c4e369bf08bf14;
    stim[38] = 61'h0fa1551d9db31712;
    stim[39] = 61'h0488badcadd480c5;
    stim[40] = 61'h1ddfded4cd2ebea0;
    stim[41] = 61'h07024b99c7111d46;
    stim[42] = 61'h199ccf8462950d6d;
    stim[43] = 61'h014e0c894c30a692;
    stim[44] = 61'h0681b6775b6eabec;
    stim[45] = 61'h0a5785e3dc8076a2;
    stim[46] = 61'h050735fd82ff4931;
    stim[47] = 61'h0e11490aa0db64ec;
    stim[48] = 61'h1144e2c6cb50d6d8;
    stim[49] = 61'h003a5fb2df46d086;
    stim[50] = 61'h14550251b1e82097;
    stim[51] = 61'h094c260d17d7f5d4;
    stim[52] = 61'h011c17c37675ad68;
    stim[53] = 61'h11f5a88cd5c84554;
    stim[54] = 61'h17e0cffd0a39563d;
    stim[55] = 61'h051e1f32e94da01f;
    stim[56] = 61'h02ed69765a0f2ba4;
    stim[57] = 61'h1bfbe376ed5cf37f;
    stim[58] = 61'h07bb6c7b0d8a24fd;
    stim[59] = 61'h048f40f2939a1566;
    stim[60] = 61'h0fcd4f87d9f01f8e;
    stim[61] = 61'h1e31b6ff9b74c7fa;
    stim[62] = 61'h06eb634a2a8088b2;
    stim[63] = 61'h115959214149ab44;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h969b1066;
      expv[2] = 32'hc51df42a;
      expv[3] = 32'hb455cff9;
      expv[4] = 32'hd549c9f8;
      expv[5] = 32'hee1f1ca3;
      expv[6] = 32'h6e426338;
      expv[7] = 32'hbc09d451;
      expv[8] = 32'h194bfc4f;
      expv[9] = 32'h13bd158c;
      expv[10] = 32'hc789bcf9;
      expv[11] = 32'h419d36a2;
      expv[12] = 32'hc6ea8362;
      expv[13] = 32'h3e07f18c;
      expv[14] = 32'h950b7a19;
      expv[15] = 32'hdaf9fa36;
      expv[16] = 32'hab5411d5;
      expv[17] = 32'h6f2034b0;
      expv[18] = 32'h8eac69d7;
      expv[19] = 32'hb4cc7d0c;
      expv[20] = 32'hb395dc22;
      expv[21] = 32'he09bdf41;
      expv[22] = 32'h5a7912dc;
      expv[23] = 32'h39a671d6;
      expv[24] = 32'h9d51c788;
      expv[25] = 32'h0122c6e0;
      expv[26] = 32'hed8a5867;
      expv[27] = 32'h53cf1f78;
      expv[28] = 32'h08c34ee6;
      expv[29] = 32'h8c95eadc;
      expv[30] = 32'hd1db1aa8;
      expv[31] = 32'h08010e72;
      expv[32] = 32'h1f691838;
      expv[33] = 32'hfe7ea87b;
      expv[34] = 32'hc885d894;
      expv[35] = 32'hfc9ee5be;
      expv[36] = 32'h87ec53da;
      expv[37] = 32'h09072606;
      expv[38] = 32'h2be117e2;
      expv[39] = 32'hb9b662e2;
      expv[40] = 32'h083a9018;
      expv[41] = 32'hddfded4c;
      expv[42] = 32'h2fe223a8;
      expv[43] = 32'h99ccf846;
      expv[44] = 32'h540614d2;
      expv[45] = 32'h27edd57d;
      expv[46] = 32'he4900ed4;
      expv[47] = 32'h0fdfe926;
      expv[48] = 32'ha09b6c9d;
      expv[49] = 32'h144e2c6c;
      expv[50] = 32'h4368da10;
      expv[51] = 32'h4550251b;
      expv[52] = 32'hd47afeba;
      expv[53] = 32'h514eb5ad;
      expv[54] = 32'h1f5a88cd;
      expv[55] = 32'h7e0cffd0;
      expv[56] = 32'h1129b403;
      expv[57] = 32'h6e41e574;
      expv[58] = 32'hbfbe376e;
      expv[59] = 32'h3b31449f;
      expv[60] = 32'h087342ac;
      expv[61] = 32'hbc3e03f1;
      expv[62] = 32'he31b6ff9;
      expv[63] = 32'h2e501116;
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
