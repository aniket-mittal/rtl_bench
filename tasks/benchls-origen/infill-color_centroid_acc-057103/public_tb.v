// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 88;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_057103 dut (
    .clk(clk),
    .resetn(in_vec[87:87]),
    .data_valid(in_vec[86:86]),
    .start_frame(in_vec[85:85]),
    .end_frame(in_vec[84:84]),
    .x(in_vec[83:72]),
    .y(in_vec[71:63]),
    .r(in_vec[62:58]),
    .g(in_vec[57:53]),
    .b(in_vec[52:48]),
    .color(in_vec[47:46]),
    .r_min(in_vec[45:41]),
    .r_max(in_vec[40:36]),
    .g_min(in_vec[35:31]),
    .g_max(in_vec[30:26]),
    .b_min(in_vec[25:21]),
    .b_max(in_vec[20:16]),
    .min_total(in_vec[15:0]),
    .x_led_acc(out_vec[96:65]),
    .y_led_acc(out_vec[64:33]),
    .total_acc(out_vec[32:1]),
    .divby0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 88'h36d38cad328fc4c4d15314;
    stim[1] = 88'h21e452065edc4ba3a7ede8;
    stim[2] = 88'h9b1c0d30094c108d34ebbb;
    stim[3] = 88'ha5383c10cb971079389836;
    stim[4] = 88'he5ca5dd995840235cf17ea;
    stim[5] = 88'h925f86579088ca821be2e5;
    stim[6] = 88'h810e5fa22374c34be77d00;
    stim[7] = 88'hb78f09ecce076ee3c8346a;
    stim[8] = 88'ha44d260a3dba955ce8b1f8;
    stim[9] = 88'hcd9378f32da4666caf1d8b;
    stim[10] = 88'ha270999456d75f0b449fac;
    stim[11] = 88'h8265c4e36276e26a73ee5a;
    stim[12] = 88'h8f993db93f3a626c1c315f;
    stim[13] = 88'hd2324cd8f2a8116482bd29;
    stim[14] = 88'hba07bbc278134ed22f540f;
    stim[15] = 88'hfa1ca0b3cb955b0d84bd6f;
    stim[16] = 88'h1bd1496304a12d43781218;
    stim[17] = 88'h98e9fd0813b000760597b7;
    stim[18] = 88'hc639dc48ccb89c05160395;
    stim[19] = 88'hdcf9f98c9d4da648546cdf;
    stim[20] = 88'hc8a1420e337ce8bec428b6;
    stim[21] = 88'hc2f6cabc326e02fd5b66fb;
    stim[22] = 88'hbf359aa4323e275806dbd3;
    stim[23] = 88'h92b5ac593b5d78f6d73510;
    stim[24] = 88'haa753a986ac1b1de477b2d;
    stim[25] = 88'h804464ae2b111547de97e1;
    stim[26] = 88'h36d31f2750e394c1f5280d;
    stim[27] = 88'h963beeba3f0a62c4434f6d;
    stim[28] = 88'hb0ca099f889f4b33f2b6bf;
    stim[29] = 88'hc934c5c1d178340b7277b4;
    stim[30] = 88'he90fd9ffdc32c6d63a84bc;
    stim[31] = 88'hd6a2e4a8576472f57ffbb8;
    stim[32] = 88'ha6a236a5bf7829390c65f9;
    stim[33] = 88'h86d47bcf552f5588cd231f;
    stim[34] = 88'ha25a5cb9f1e65ab7c46c49;
    stim[35] = 88'hc98d1d567bff2a81d7041e;
    stim[36] = 88'hda0d73a9530e24e63deaeb;
    stim[37] = 88'hef0f47584a513ba62ac1fe;
    stim[38] = 88'hc54cceb1bc3002eecc3e92;
    stim[39] = 88'h8562b60ce77b04b58a6c4d;
    stim[40] = 88'hd8baf72ef3af4d9f77fc2a;
    stim[41] = 88'h90b08b10e279ff87f24c3d;
    stim[42] = 88'he3d056473db41276ff7828;
    stim[43] = 88'he577758fa4a83a1486ad06;
    stim[44] = 88'hde1581fe1098cd223e5eef;
    stim[45] = 88'hce28b8540fe432e3c4372a;
    stim[46] = 88'hcbf2f306ab9fab5613915b;
    stim[47] = 88'h6c38192a05c05962a6b033;
    stim[48] = 88'hf8d6dc28393eece2ca54c9;
    stim[49] = 88'hddf61f3a4bf3bd5f89af9f;
    stim[50] = 88'h8af623c7bf69a5b620750c;
    stim[51] = 88'h887022200b69bc13d0e028;
    stim[52] = 88'hdd2dd0a644d9db0bc6b1a8;
    stim[53] = 88'hd2a974b472599598179ebb;
    stim[54] = 88'h83ce7f221a87c772bb4e05;
    stim[55] = 88'he63e22c74da44e776ddf41;
    stim[56] = 88'hac2176645ca52a7b6a91a9;
    stim[57] = 88'h9c93aed143e694c61c8885;
    stim[58] = 88'hce71250083cc6a4ba70426;
    stim[59] = 88'hbac2e6622140db4ba63ca8;
    stim[60] = 88'ha8cd82cf98bb67b59c2d9c;
    stim[61] = 88'ha85762e150b797a1c5c159;
    stim[62] = 88'h91141375000b0cbef345c6;
    stim[63] = 88'he8462242acc03783686f4c;
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
      expv[0] = 97'h0000000000000000000000000;
      expv[1] = 97'h0000000000000000000000000;
      expv[2] = 97'h0000000000000000000000000;
      expv[3] = 97'h0000000000000000000000002;
      expv[4] = 97'h0000000000000000000000002;
      expv[5] = 97'h0000000000000000000000002;
      expv[6] = 97'h0000000000000000000000002;
      expv[7] = 97'h0000000000000000000000002;
      expv[8] = 97'h0000000000000000000000002;
      expv[9] = 97'h0000000000000000000000002;
      expv[10] = 97'h0000000000000000000000002;
      expv[11] = 97'h0000000000000000000000002;
      expv[12] = 97'h0000000000000000000000002;
      expv[13] = 97'h0000000000000000000000002;
      expv[14] = 97'h0000000000000187a00000002;
      expv[15] = 97'h0000000000000187a00000002;
      expv[16] = 97'h0000000000000000000000000;
      expv[17] = 97'h0000000000000000000000000;
      expv[18] = 97'h0000000000000000000000002;
      expv[19] = 97'h0000000000000000000000002;
      expv[20] = 97'h0000000000000000000000002;
      expv[21] = 97'h0000000000000000000000002;
      expv[22] = 97'h0000000000000000000000002;
      expv[23] = 97'h0000000000000000000000002;
      expv[24] = 97'h0000000000000000000000002;
      expv[25] = 97'h0000000000000000000000002;
      expv[26] = 97'h0000000000000000000000000;
      expv[27] = 97'h0000000000000000000000000;
      expv[28] = 97'h0000000000000000000000002;
      expv[29] = 97'h0000000000000000000000002;
      expv[30] = 97'h0000000000000000000000002;
      expv[31] = 97'h0000000000000000000000002;
      expv[32] = 97'h0000000000000000000000002;
      expv[33] = 97'h0000000000000000000000002;
      expv[34] = 97'h0000000000000000000000002;
      expv[35] = 97'h0000000000000000000000002;
      expv[36] = 97'h0000000000000000000000002;
      expv[37] = 97'h0000000000000000000000002;
      expv[38] = 97'h0000000000000000000000002;
      expv[39] = 97'h0000000000000000000000002;
      expv[40] = 97'h0000000000000000000000002;
      expv[41] = 97'h0000000000000000000000002;
      expv[42] = 97'h0000000000000000000000002;
      expv[43] = 97'h0000000000000000000000002;
      expv[44] = 97'h0000000000000000000000002;
      expv[45] = 97'h0000000000000000000000002;
      expv[46] = 97'h0000000000000000000000002;
      expv[47] = 97'h0000000000000000000000000;
      expv[48] = 97'h0000000000000000000000000;
      expv[49] = 97'h0000000000000000000000002;
      expv[50] = 97'h0000000000000000000000002;
      expv[51] = 97'h0000000000000000000000002;
      expv[52] = 97'h0000000000000000000000002;
      expv[53] = 97'h0000000000000000000000002;
      expv[54] = 97'h0000000000000000000000002;
      expv[55] = 97'h0000000000000000000000002;
      expv[56] = 97'h0000000000000000000000002;
      expv[57] = 97'h0000000000000000000000002;
      expv[58] = 97'h0000000000000000000000002;
      expv[59] = 97'h0000000000000000000000002;
      expv[60] = 97'h0000000000000000000000002;
      expv[61] = 97'h0000000000000000000000002;
      expv[62] = 97'h0000000000000000000000002;
      expv[63] = 97'h0000000000000000000000002;
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
