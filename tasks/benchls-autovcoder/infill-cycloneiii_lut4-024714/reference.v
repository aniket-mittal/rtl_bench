module autovcoder_024714 (
    dataa,
    datab,
    datac,
    datad,
    cin,
    combout,
    cout
);

  input dataa;
  input datab;
  input datac;
  input datad;
  input cin;

  output combout;
  output cout;

  parameter lut_mask = 16'hFFFF;
  parameter sum_lutc_input = "datac";
  parameter dont_touch = "off";
  parameter lpm_type = "cycloneiii_lcell_comb";

  reg cout_tmp;
  reg combout_tmp;

  reg [1:0] isum_lutc_input;

  wire dataa_in;
  wire datab_in;
  wire datac_in;
  wire datad_in;
  wire cin_in;

  buf (dataa_in, dataa);
  buf (datab_in, datab);
  buf (datac_in, datac);
  buf (datad_in, datad);
  buf (cin_in, cin);

  specify

    (dataa => combout) = (0, 0);
    (datab => combout) = (0, 0);
    (datac => combout) = (0, 0);
    (datad => combout) = (0, 0);
    (cin => combout) = (0, 0);

    (dataa => cout) = (0, 0);
    (datab => cout) = (0, 0);
    (cin => cout) = (0, 0);

  endspecify

  // 4-input LUT function
  function lut4;
    input [15:0] mask;
    input dataa;
    input datab;
    input datac;
    input datad;

    begin

      lut4 = datad ? ( datac ? ( datab ? ( dataa ? mask[15] : mask[14])
                                     : ( dataa ? mask[13] : mask[12]))
                           : ( datab ? ( dataa ? mask[11] : mask[10]) 
                                     : ( dataa ? mask[ 9] : mask[ 8])))
                 : ( datac ? ( datab ? ( dataa ? mask[ 7] : mask[ 6]) 
                                     : ( dataa ? mask[ 5] : mask[ 4]))
                           : ( datab ? ( dataa ? mask[ 3] : mask[ 2]) 
                                     : ( dataa ? mask[ 1] : mask[ 0])));

    end
  endfunction

  initial begin
    if (sum_lutc_input == "datac") isum_lutc_input = 0;
    else if (sum_lutc_input == "cin") isum_lutc_input = 1;
    else begin
      $display("Error: Invalid sum_lutc_input specified\n");
      $display("Time: %0t  Instance: %m", $time);
      isum_lutc_input = 2;
    end

  end

  always @(datad_in or datac_in or datab_in or dataa_in or cin_in) begin

    if (isum_lutc_input == 0) // datac 
    begin
      combout_tmp = lut4(lut_mask, dataa_in, datab_in, datac_in, datad_in);
    end
    else if (isum_lutc_input == 1) // cin
    begin
      combout_tmp = lut4(lut_mask, dataa_in, datab_in, cin_in, datad_in);
    end

    cout_tmp = lut4(lut_mask, dataa_in, datab_in, cin_in, 'b0);
  end

  and (combout, combout_tmp, 1'b1);
  and (cout, cout_tmp, 1'b1);

endmodule

