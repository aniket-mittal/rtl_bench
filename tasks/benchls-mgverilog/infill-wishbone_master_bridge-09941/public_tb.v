// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09941 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .d_read_en(in_vec[99:99]),
    .d_write_en(in_vec[98:98]),
    .d_addr(in_vec[97:66]),
    .d_write_data(in_vec[65:34]),
    .wbm_done_pls_i(in_vec[33:33]),
    .wbm_dat_i(in_vec[32:1]),
    .wbm_ack_i(in_vec[0:0]),
    .done_o(out_vec[103:103]),
    .d_data_out(out_vec[102:71]),
    .wbm_dat_o(out_vec[70:39]),
    .wbm_we_o(out_vec[38:38]),
    .wbm_sel_o(out_vec[37:34]),
    .wbm_adr_o(out_vec[33:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_stb_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h12b6d364037a0c2c46808618b6;
    stim[1] = 101'h1747c050eeb4285fd4d4583e8e;
    stim[2] = 101'h0b64598cfc3471fb8a1c0c2220;
    stim[3] = 101'h07a617a3df9de3bb915a663b9e;
    stim[4] = 101'h0ea5313b75ee0d28f130a3eff5;
    stim[5] = 101'h00dd3c45a2fc345a3f0420f0ec;
    stim[6] = 101'h074aaaaed8b30a1142551530a1;
    stim[7] = 101'h0bf308b71bc3e0ad237f8ffaeb;
    stim[8] = 101'h0c3e4b07de2ebc3930be9b0390;
    stim[9] = 101'h0d1fcab30ef271d3720d57a657;
    stim[10] = 101'h071b81b668efffb7f8ca488bba;
    stim[11] = 101'h03d319f3267750ab6fd7f0558d;
    stim[12] = 101'h0b9c369a1f61b4f32538c6dd62;
    stim[13] = 101'h0797be00de03016c21a2144ce9;
    stim[14] = 101'h020311235ebfb46028fd543266;
    stim[15] = 101'h115676a38f6ebf0f2e9d7c8aa4;
    stim[16] = 101'h0daf9c963cc64aa4cb820d5bce;
    stim[17] = 101'h1477ebcf0a97140f41975dd6a1;
    stim[18] = 101'h04f4bed2089fc505fa080e7bac;
    stim[19] = 101'h0ae878844d3103306bab216795;
    stim[20] = 101'h02f76b7f04ef4c84b7abcbecf5;
    stim[21] = 101'h015632b8a5cfeb668e2a4139e2;
    stim[22] = 101'h0a4f83328eb0bb8e2891186901;
    stim[23] = 101'h0ef541e48e4c11350d84d1a3f9;
    stim[24] = 101'h00305f1e36b472c15746159b00;
    stim[25] = 101'h0839f56d2a9f6b1ad0076cda97;
    stim[26] = 101'h0ed47533ce136a3b8b560311e9;
    stim[27] = 101'h0a7d058f4517015585f5848e39;
    stim[28] = 101'h030b4c6479cddd463059e067a2;
    stim[29] = 101'h189ab0676b7de5e9a22adb8a03;
    stim[30] = 101'h0d8304e519e7d0d9b131099017;
    stim[31] = 101'h0c074d1efc6ce574d881031c81;
    stim[32] = 101'h09ad3638587f49134d00863d19;
    stim[33] = 101'h0bc7904298def23dd6dccee6c4;
    stim[34] = 101'h00c39e01ee79b0160fe202baba;
    stim[35] = 101'h09c56f7711d34bdbd01ccafa03;
    stim[36] = 101'h0d295b69f9dc3a1a53d764cd70;
    stim[37] = 101'h0ec297ec96a3ac57f27d26b923;
    stim[38] = 101'h0f4b695e2f477d3ea97c22a9ce;
    stim[39] = 101'h014a82ca94064b54b599d51a43;
    stim[40] = 101'h03832a1cd3baa7dfc6ab810629;
    stim[41] = 101'h0d19dcff42aab6828203fef5a9;
    stim[42] = 101'h0d0720b5ecdc9fedf094f82e0c;
    stim[43] = 101'h0ead133128eef57037cd38d92f;
    stim[44] = 101'h0612f9282ba0d1a47d101873e8;
    stim[45] = 101'h088fb2c6b1da71c5487093702b;
    stim[46] = 101'h0a9a2dad21a8a7de87790a6733;
    stim[47] = 101'h02da2fe69c4d3320a56943f161;
    stim[48] = 101'h01ff7d3926c0a15f34d3026245;
    stim[49] = 101'h0af83354b1cd3529adbb8227b6;
    stim[50] = 101'h0fb2e8b627d6f7c24f05324b80;
    stim[51] = 101'h06975ca185a04e6579817343c0;
    stim[52] = 101'h0fdcae61cd3fe1309202bc95ae;
    stim[53] = 101'h1da532d7e257bb24bf6326edf6;
    stim[54] = 101'h05fb5c13cae39759f7f9fadc6a;
    stim[55] = 101'h07a905ce697187aaa9b1f2e0f1;
    stim[56] = 101'h02abac6992aa57f5e46c075f17;
    stim[57] = 101'h0a15628875cf7b307f6e9ccf25;
    stim[58] = 101'h0aff0a131f4d5714d15b821ff4;
    stim[59] = 101'h00c1ea0392fc3d395a523d1b81;
    stim[60] = 101'h086da86f32bb075067ccd54832;
    stim[61] = 101'h0d84895ab8ec24f9374e8ddaae;
    stim[62] = 101'h0c58c970e7eadf44c0337170b5;
    stim[63] = 101'h0bc464756eeb6c64406b1cd044;
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
      expv[0] = 104'h00000000000000003c00000000;
      expv[1] = 104'h00000000000000003c00000000;
      expv[2] = 104'h00000000000000003c00000000;
      expv[3] = 104'h00000000000000003f64598cff;
      expv[4] = 104'h00000000000000003f64598cff;
      expv[5] = 104'hcc28fbfd000000003f64598cfc;
      expv[6] = 104'hcc28fbfd000000003f64598cfc;
      expv[7] = 104'h4c28fbfd000000003f64598cfc;
      expv[8] = 104'h4c28fbfd000000003f64598cfc;
      expv[9] = 104'h4c28fbfd000000003f64598cfc;
      expv[10] = 104'hcc28fbfd000000003f64598cfc;
      expv[11] = 104'h4c28fbfd000000003f64598cfc;
      expv[12] = 104'hcc28fbfd000000003f64598cfc;
      expv[13] = 104'h4c28fbfd000000003f64598cfc;
      expv[14] = 104'h4c28fbfd40602d847f97be00df;
      expv[15] = 104'h00000000000000003c00000000;
      expv[16] = 104'h00000000000000003c00000000;
      expv[17] = 104'h00000000000000003c00000000;
      expv[18] = 104'h00000000000000003c00000000;
      expv[19] = 104'h0000000013f8a0bf7cf4bed20b;
      expv[20] = 104'h8000000013f8a0bf3cf4bed208;
      expv[21] = 104'h8000000013f8a0bf3cf4bed208;
      expv[22] = 104'h0000000013f8a0bf3cf4bed208;
      expv[23] = 104'h0000000013f8a0bf3cf4bed208;
      expv[24] = 104'h00000000498226a1fef541e48f;
      expv[25] = 104'h00000000498226a1fef541e48f;
      expv[26] = 104'h80000000498226a1bef541e48c;
      expv[27] = 104'h00000000426d47717ed47533cf;
      expv[28] = 104'h80000000426d47713ed47533cc;
      expv[29] = 104'h00000000000000003c00000000;
      expv[30] = 104'h00000000000000003c00000000;
      expv[31] = 104'h000000003cfa1b367d8304e51b;
      expv[32] = 104'h800000003cfa1b363d8304e518;
      expv[33] = 104'h000000003cfa1b363d8304e518;
      expv[34] = 104'h800000003cfa1b363d8304e518;
      expv[35] = 104'h000000003cfa1b363d8304e518;
      expv[36] = 104'h000000003cfa1b363d8304e518;
      expv[37] = 104'h000000003b87434a7d295b69fb;
      expv[38] = 104'h800000003b87434a3d295b69f8;
      expv[39] = 104'h000000003b87434a3d295b69f8;
      expv[40] = 104'h000000003b87434a3d295b69f8;
      expv[41] = 104'h800000003b87434a3d295b69f8;
      expv[42] = 104'h000000003b87434a3d295b69f8;
      expv[43] = 104'h000000003b87434a3d295b69f8;
      expv[44] = 104'h800000003b87434a3d295b69f8;
      expv[45] = 104'h000000003b87434a3d295b69f8;
      expv[46] = 104'h000000003b87434a3c8fb2c6b3;
      expv[47] = 104'hde4299ccbb87434a3c8fb2c6b0;
      expv[48] = 104'h5e4299ccbb87434a3c8fb2c6b0;
      expv[49] = 104'h5e4299ccbb87434a3c8fb2c6b0;
      expv[50] = 104'h5e4299ccbb87434a3ef83354b3;
      expv[51] = 104'h5e4299ccbb87434a3ef83354b3;
      expv[52] = 104'h5e4299ccbb87434a3ef83354b3;
      expv[53] = 104'h00000000000000003c00000000;
      expv[54] = 104'h00000000000000003c00000000;
      expv[55] = 104'h000000005c72eb3efdfb5c13cb;
      expv[56] = 104'h800000005c72eb3ebdfb5c13c8;
      expv[57] = 104'h000000005c72eb3ebdfb5c13c8;
      expv[58] = 104'h000000005c72eb3ebe15628877;
      expv[59] = 104'h000000005c72eb3ebe15628877;
      expv[60] = 104'h948f46e05c72eb3ebe15628874;
      expv[61] = 104'h148f46e05c72eb3ebc6da86f33;
      expv[62] = 104'h148f46e05c72eb3ebc6da86f33;
      expv[63] = 104'h8cdc5c2d5c72eb3ebc6da86f30;
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
