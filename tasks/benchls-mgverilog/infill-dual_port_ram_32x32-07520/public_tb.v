// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07520 dut (
    .clock_a(clk),
    .data_a(in_vec[76:45]),
    .wren_a(in_vec[44:44]),
    .address_a(in_vec[43:39]),
    .clock_b(in_vec[38:38]),
    .data_b(in_vec[37:6]),
    .wren_b(in_vec[5:5]),
    .address_b(in_vec[4:0]),
    .q_a(out_vec[63:32]),
    .q_b(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h126c8a98deb1e774b3f1;
    stim[1] = 77'h12ef720dd83df7a3015b;
    stim[2] = 77'h1a92800e959bd53ef6c2;
    stim[3] = 77'h18248bd9508e07d822d6;
    stim[4] = 77'h132002a5fb2ddbf8b027;
    stim[5] = 77'h11cff438dddc6ac5fa41;
    stim[6] = 77'h04ad5a6d22b8b2183d98;
    stim[7] = 77'h1e1d1e9054e1cdbd18ea;
    stim[8] = 77'h14575d633e72cabd7873;
    stim[9] = 77'h130291de7de8a1b6a276;
    stim[10] = 77'h0b23d88838fbb6e7de5f;
    stim[11] = 77'h0614e652e46bb057be40;
    stim[12] = 77'h14ef1b79b37d92ca4b13;
    stim[13] = 77'h107e7e0c59ba400803eb;
    stim[14] = 77'h0894d861ddc2d86b5494;
    stim[15] = 77'h1f488e5d80bc25a79221;
    stim[16] = 77'h033e2805b6c175f75e58;
    stim[17] = 77'h0f439db9e8b3a37f25c0;
    stim[18] = 77'h048f2fc4473fe3bbf30f;
    stim[19] = 77'h0dc75c3a59f8c4e06a6e;
    stim[20] = 77'h04fada1684b3d5ce146e;
    stim[21] = 77'h186a8ee2530179f4aa18;
    stim[22] = 77'h12afea70c92affc77600;
    stim[23] = 77'h0b9f8322fb1ab37d59aa;
    stim[24] = 77'h077fd6aa73e7e706625b;
    stim[25] = 77'h1abc8eb3db4222ac6df5;
    stim[26] = 77'h08a5d644dacbd48a5257;
    stim[27] = 77'h0f8a85960b00e31f10ee;
    stim[28] = 77'h01f46de4240572a13cd2;
    stim[29] = 77'h097441fd82fad63d1fa4;
    stim[30] = 77'h05d1cec9e48561ca8948;
    stim[31] = 77'h065dcd6accd5b4c11532;
    stim[32] = 77'h14ef62428659c56fc790;
    stim[33] = 77'h074f6b70d081b638e399;
    stim[34] = 77'h196370ebdc9d03f4bc89;
    stim[35] = 77'h06c0f647a0ea2c9e9163;
    stim[36] = 77'h1dc48c5127db8626c8cb;
    stim[37] = 77'h10f6713da242ea335255;
    stim[38] = 77'h199e0c0bd597fc2f220f;
    stim[39] = 77'h0399e17a5a7212c65551;
    stim[40] = 77'h1aba533b7a3f0334c7b8;
    stim[41] = 77'h061feb6ebe7d7525768d;
    stim[42] = 77'h002b4203e13685b46849;
    stim[43] = 77'h1dfa34e2873fdf3f0c56;
    stim[44] = 77'h002db7d459947c556e69;
    stim[45] = 77'h13816ef504a00f4ffa71;
    stim[46] = 77'h19a3dd3277489bfc22bc;
    stim[47] = 77'h059af7259c9c2ca53522;
    stim[48] = 77'h108eade9eebd8f739157;
    stim[49] = 77'h13f6af2f8973c7138573;
    stim[50] = 77'h007d2cb7234671b512da;
    stim[51] = 77'h0c639941af0086105068;
    stim[52] = 77'h1a61ca3ee508a5ce44f5;
    stim[53] = 77'h05a1d2b8b189456d17ff;
    stim[54] = 77'h139ba15ec05ac7f9af64;
    stim[55] = 77'h1331029ed327bd5b1853;
    stim[56] = 77'h0a990e7e3df0c98ec0bf;
    stim[57] = 77'h1bff2481dbf5a7f1ae2c;
    stim[58] = 77'h13f83d11065d31b1b169;
    stim[59] = 77'h0748402f5c58676f4d7b;
    stim[60] = 77'h18f7c94095eaa300f8de;
    stim[61] = 77'h10b9efd5092441b475ff;
    stim[62] = 77'h0faf4a0a39d3f2a67f0b;
    stim[63] = 77'h04a89d2aba9478ff1c14;
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
      expv[5] = 64'hxxxxxxxxc1245eca;
      expv[6] = 64'hxxxxxxxxc1245eca;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'h8e7fa1c6xxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'h98148ef3xxxxxxxx;
      expv[16] = 64'hc1245ecaxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'h591ec441xxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'h83f3f062xxxxxxxx;
      expv[21] = 64'hf0e8f482xxxxxxxx;
      expv[22] = 64'ha778dbcdxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'h9900152f44a6c30e;
      expv[25] = 64'hxxxxxxxx44a6c30e;
      expv[26] = 64'h5cfc191744a6c30e;
      expv[27] = 64'hxxxxxxxx44a6c30e;
      expv[28] = 64'hd5e4759e44a6c30e;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hf0e8f482xxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hc1245ecaxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'h3a7b5b86xxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'heb58f47exxxxxxxx;
      expv[39] = 64'hd4940074591ec441;
      expv[40] = 64'hxxxxxxxx591ec441;
      expv[41] = 64'h1ccf0bd219f1402d;
      expv[42] = 64'ha2baeb1919f1402d;
      expv[43] = 64'hxxxxxxxx19f1402d;
      expv[44] = 64'he31381a919f1402d;
      expv[45] = 64'h6e3ae1d219f1402d;
      expv[46] = 64'hf0e8f48230ff5b75;
      expv[47] = 64'he31381a930ff5b75;
      expv[48] = 64'hcb1b875e30ff5b75;
      expv[49] = 64'h936454c6016dbea2;
      expv[50] = 64'h56d30454016dbea2;
      expv[51] = 64'hc3547712016dbea2;
      expv[52] = 64'hxxxxxxxx016dbea2;
      expv[53] = 64'h8736f463016dbea2;
      expv[54] = 64'ha8b27a45eb58f47e;
      expv[55] = 64'hxxxxxxxxeb58f47e;
      expv[56] = 64'hc3547712xxxxxxxx;
      expv[57] = 64'h44a6c30exxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hccf0605exxxxxxxx;
      expv[62] = 64'h56d30454c7be4a04;
      expv[63] = 64'hcf1c4e15c7be4a04;
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
